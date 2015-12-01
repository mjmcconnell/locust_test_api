from datetime import datetime

from locust import HttpLocust, TaskSet, task

TYPE_MAP = {
    'datetime': datetime.now(),
    'integer': 1,
    'string': 'original',
    'field': None,
}


class MainTasks(TaskSet):
    """Primary task set of the app
    """

    post_data_options = None

    def _make_options_request(self, url, section):
        """Work out the available options for a given endpoint
        If it accepts POST requests, build out an object the endpoint expects
        """
        fieldset = None
        response = self.client.options(url)
        json_response = response.json()
        actions = json_response['actions']

        if actions.get('POST'):
            fieldset = json_response['actions']['POST']
        elif actions.get('PUT'):
            fieldset = json_response['actions']['PUT']

        if fieldset:
            options = {}
            for field, attrs in fieldset.iteritems():
                # Ignore read only fields
                if attrs['read_only'] is True:
                    continue

                # Set an appropriate value to each field
                options[field] = TYPE_MAP.get(attrs['type'])

            self.post_data_options = options

        return json_response

    def _make_get_request(self, url):
        """Make a get request, and return the json body
        """
        response = self.client.get(url)
        return response.json()

    def _make_post_request(self, url):
        """Make a post request with values populated
        in the "options" request, and return the json body
        """
        response = self.client.post(url, self.post_data_options)
        return response.json()

    def _make_put_request(self, url):
        """Make a put request with values populated
        in the "options" request, and return the json body
        """
        response = self.client.put(url, self.post_data_options)
        return response.json()

    def _make_delete_request(self, url):
        """Send a delete request
        """
        self.client.delete(url)

    @task
    def spider(self):
        """Navigates through the API
        """
        response = self._make_get_request("/")
        for section, url in response.iteritems():
            # View the root page
            self._make_get_request(url)

            # View the possible options for the current section
            options = self._make_options_request(url, section)

            if 'POST' in options['actions']:
                # Send the post request to create a new record
                post_response = self._make_post_request(url)
                # Ensure the new record has been stored in the datastore
                # by looking up its api endpoint
                self._make_get_request(post_response['url'])
                # View the possible options for the current section
                record_options = self._make_options_request(
                    post_response['url'], section)

                if 'PUT' in record_options['actions']:
                    # Test we can update the record
                    self._make_put_request(post_response['url'])

                # Then we finally ensure we can delete said record
                self._make_delete_request(post_response['url'])


class WebsiteUser(HttpLocust):
    """Entry point of the app
    """

    # Note the host url uses the "web" vhost name
    # to map to the web docker instance ip address
    host = "http://app:8000"
    task_set = MainTasks
