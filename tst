# Extract the "name", "attributes", and "dataType" sections for all entities
entities_data = [{"entity_name": entity["name"], "attributes": entity["attributes"]} for entity in data["entities"]]
attribute_data = [{"entity_name": entity["name"], "attribute_name": attr["name"], "dataType": attr["dataType"]} for entity in entities_data for attr in entity["attributes"]]

# Create a pandas DataFrame with three columns
df = pd.DataFrame({"entity_name": [entity["entity_name"] for entity in entities_data],
                   "attribute_name": [attr["attribute_name"] for attr in attribute_data],
                   "dataType": [attr["dataType"] for attr in attribute_data]})
