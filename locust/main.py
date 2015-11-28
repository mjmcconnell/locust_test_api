import json

from locust import HttpLocust, TaskSet, task


class WebsiteTasks(TaskSet):

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
                post_data = {}
                for field, attrs in request_options['actions']['POST'].iteritems():
                    if attrs['read_only'] is True:
                        pass

                    if attrs['type'] == 'integer':
                        post_data[field] = 1
                    elif attrs['type'] == 'string':
                        post_data[field] = 'run on {}'.format(section)

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
