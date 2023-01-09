from kafka import  KafkaAdminClient
from kafka.admin import NewTopic, ConfigResource, ConfigResourceType

admin_client = KafkaAdminClient(api_version=(2, 8, 0), bootstrap_servers="192.168.0.101:9092", client_id='test')
topic_list = []

new_topic = NewTopic(name="bankbranch2", num_partitions= 2, replication_factor=1)
topic_list.append(new_topic)
admin_client.create_topics(new_topics=topic_list)

configs = admin_client.describe_configs(
    config_resources=[ConfigResource(ConfigResourceType.TOPIC, "bankbranch")])