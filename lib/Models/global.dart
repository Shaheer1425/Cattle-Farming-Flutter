class FarmManager {
  static int selectedFarmId = 0; // Default value

  // Function to set the selected farm ID
  static void setSelectedFarmId(int farmId) {
    selectedFarmId = farmId;
  }

  // Function to get the selected farm ID
  static int getSelectedFarmId() {
    return selectedFarmId;
  }
}
