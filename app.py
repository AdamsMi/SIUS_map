from flask import Flask, request
from flask_restful import Resource, Api


app = Flask(__name__)
api = Api(app)

class Coordinator_Runner(Resource):
    def get(self):

        import random
        lat_1 = 50.0619720 + random.random()*0.0001
        long_1 = 19.9379 + random.random()*0.0001
        lat_2 = 50.06196 + random.random()*0.0001
        long_2 = 19.9378 + random.random()*0.0001

        return {'coords':{"1":[str(lat_1), str(long_1)], "2": [str(lat_2), str(long_2)]}}



api.add_resource(Coordinator_Runner, '/coords')

if __name__ == '__main__':
     app.run()