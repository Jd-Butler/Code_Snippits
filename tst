import json
import pandas as pd

# Read the JSON data from a file on your local computer
with open("path/to/your/json/file.json", "r") as f:
    json_data = f.read()

# Parse the JSON data
data = json.loads(json_data)

# Extract the "name", "attributes", and "dataType" sections for all entities
entities_data = [{"entity_name": entity.get("name", ""), "attributes": entity.get("attributes", [])} for entity in data["entities"]]
attribute_data = [{"entity_name": entity["entity_name"], "attribute_name": attr.get("name", ""), "dataType": attr.get("dataType", "")} for entity in entities_data for attr in entity["attributes"]]

# Create a pandas DataFrame with three columns
df = pd.DataFrame({"entity_name": [entity["entity_name"] for entity in entities_data],
                   "attribute_name": [attr["attribute_name"] for attr in attribute_data],
                   "dataType": [attr["dataType"] for attr in attribute_data]})

# Print the DataFrame
print(df)
