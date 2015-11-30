import json
from datetime import datetime

from locust import HttpLocust, TaskSet, task

TYPE_MAP = {
    'datetime': datetime.now(),
    'integer': 1,
    'sting': 'test',
    'field': None,
}


class WebsiteTasks(TaskSet):

    post_data_options = None
    bad_post_data_options = {
        'this_field_does': 'not exist'
    }

    def _make_options_request(self, url, section):
        """Work out the available options for a given endpoint
        If it accepts POST requests, build out an object the endpoint expects
        """
        request = self.client.options(url)

        if 'POST' in request['actions']:
            options = {}
            for field, attrs in request['actions']['POST'].iteritems():
                # Ignore read only fields
                if attrs['read_only'] is True:
                    continue

                if attrs['type'] == 'integer':
                    options[field] = 1
                elif attrs['type'] == 'string':
                    options[field] = 'run on {}'.format(section)


            self.post_data_options = options

    def _make_get_request(self, url):
        request = self.client.get(url)

    def _make_post_request(self, url, post_data_options):
        request = self.client.post(url)

    def _make_put_request(self, url, post_data_options):
        request = self.client.put(url)

    def _make_delete_request(self, url):
        request = self.client.delete(url)

    @task(10)
    def index_page(self):
        request = self.client.get("/")
        for section, url in json.loads(request.content).iteritems():
            # View the possible options for the current section
            s_request = self.client.options(url)
            request_options = json.loads(s_request.content)

            # If we can send post requests, populate the post data and try to
            # create a new object
            if 'POST' in request_options['actions']:


                # Send the post request to create a new record
                p_request = self.client.post(url, post_data)
                # Ensure the new record has been stored in the datastore
                # by looking up its api endpoint
                record_url = json.loads(p_request.content)['url']
                get_request = self.client.get(record_url)

                # Test we can update the record
                put_request = self.client.put(post_data)

                # Then we finally ensure we can delete said record
                delete_request = self.client.delete(record_url)


class WebsiteUser(HttpLocust):
    host = "http://localhost:8000"

    task_set = WebsiteTasks
    max_wait = 1500
