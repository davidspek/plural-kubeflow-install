import boto3
from tqdm import tqdm

# s3_client = boto3.client('s3')
# response = s3_client.get_object(Bucket='plrl-postgres-wal',Key='spilo/plural-postgres-chatwoot/4f04e88a-df6d-40e6-aa1b-cf620521675d/wal/13/wal_005/00000082.history.lz4')

# print(response.get('ServerSideEncryption'))

s3 = boto3.resource('s3')
bucket = s3.Bucket('plural-tf-state')

unencrypted_key = []
objs = bucket.objects.all()

count_obj = sum(1 for _ in objs)

with tqdm(total=count_obj) as pbar:
    for obj in tqdm(objs):
        key = s3.Object(bucket.name, obj.key)
        if key.server_side_encryption == None:
            unencrypted_key.append(obj.key)
            with open('unencrypted_files.txt', 'a') as f:
                f.write(f"{obj.key}\n")
        pbar.update(1)

# with open('unencrypted_files.txt', 'a') as f:
#     for line in unencrypted_key:
#         f.write(f"{line}\n")

print("Number of unencrypted files:", len(unencrypted_key))
