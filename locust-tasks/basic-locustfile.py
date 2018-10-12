from locust import HttpLocust, TaskSet, task

class UserBehavior(TaskSet):

    @task
    def get_tests(self):
        self.client.get("/")

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
