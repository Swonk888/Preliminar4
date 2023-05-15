from flask import Flask, request, jsonify
from query_ORM import contractData

app = Flask(__name__)
@app.route('/contrato', methods=['Post'])

def getContrato():
    ID = request.json['filter']
    result = contractData(ID)
    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True)