from kafka import KafkaAdminClient, KafkaProducer
import json

admin_client = KafkaAdminClient(bootstrap_servers="192.168.0.101:9092", client_id='test')
producer = KafkaProducer(value_serializer=lambda v: json.dumps(v).encode('utf-8'))
producer.send("bankbranch", {'atmid':1, 'transid':100})
producer.send("bankbranch", {'atmid':2, 'transid':101})