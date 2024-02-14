int findIdByName(String name, Map<int, String> map) {
  for (var entry in map.entries) {
    if (entry.value == name) {
      return entry.key;
    }
  }
  return 0; // Return -1 or any value indicating that the name was not found
}

String findNameById(int id, Map<int, String> map) {
  for (var entry in map.entries) {
    if (entry.key == id) {
      return entry.value;
    }
  }
  return ""; // Return -1 or any value indicating that the name was not found
}
  

 