from kafka import KafkaConsumer, KafkaAdminClient

admin_client = KafkaAdminClient(bootstrap_servers="192.168.0.101:9092", client_id='test')
consumer = KafkaConsumer('bankbranch')
for msg in consumer:
    print(msg.value.decode("utf-8"))

