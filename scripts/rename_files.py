import os

# Directory containing the files
directory = '/Users/harekrsna/Desktop/Work/Instant-Python/splittest'
#prefix = 'new_'

# Loop through all files in the directory
for filename in os.listdir(directory):
    #if filename.endswith('.txt'):
    #new_name = prefix + filename
    new_name = filename + ".csv"
    os.rename(os.path.join(directory, filename), os.path.join(directory, new_name))

print("Files renamed successfully.")
