# Newmark Method in Marine Structures GUI

This MATLAB GUI application simulates and visualizes the displacement and velocity of a system (like a Marine structure) subjected to wave forces using the Newmark method. The GUI allows users to input various parameters, run the simulation, and view the results in graphical form.

## Features

- Input fields for key parameters such as wave length, wave height, water depth, drag coefficient, and more.
- Real-time simulation of displacement and velocity based on the Newmark method.
- Dynamic plotting of displacement and velocity against time.
- Basic error handling for incorrect input types.

## Getting Started

### Prerequisites

- MATLAB R2017b or later with App Designer for GUI development.
- No additional toolboxes are required.

### Installation

1.  Download or clone the repository to your local machine. (If you have a GitHub repo add its link here)
2.  Save the file `Newmark_method_in_Marine_structures_GUI.mlapp` (or `Newmark_method_in_Marine_structures_GUI.m` if GUIDE was used) in a MATLAB-accessible directory.

### Running the Application

1.  Open MATLAB.
2.  Navigate to the directory containing the `Newmark_method_in_Marine_structures_GUI.m`.
3.  just run the `.m` file).

The GUI window will open, allowing you to input the required parameters.

## User Guide

### Input Fields

All inputs are expected to be positive real numbers, following SI units.

*   **Wave length (meters):** The length of the wave. Default value is 156.
*   **Wave height (meters):** The vertical distance between a wave's crest and trough. Default value is 11.16.
*   **Water depth (meters):** The depth of the water at the location of the structure. Default value is 100.
*   **Added mass coefficient (dimensionless):** Coefficient accounting for the mass of water that moves with the structure. Default value is 1.1.
*   **Drag coefficient (dimensionless):** Coefficient accounting for resistance to motion through water. Default value is 1.2.
*   **Diameter of the body (meters):** Representative diameter of the structure. Default value is 1.
*   **Wave period (seconds):** Time between two wave crests. Default value is 8.21.
*   **Number of time steps for the simulation (integer):**  Number of points in the time vector. Default value is 100.
*   **Time step size (seconds):** The time difference between each simulation step. Default value is 0.5.
*   **Spring stiffness (N/m):** Elasticity of any restoring force. Default value is 204.72×10⁶.
*   **Mass of the system (kg):** Total mass of the structure. Default value is 5.82661×10⁶.
*   **Damping coefficient (N·s/m):** Coefficient accounting for any energy dissipation in the system. Default value is 2.07×10⁶.

### Buttons

*   **Run Simulation:** Press this button to compute the displacement and velocity using the Newmark method and display the results on the plot.
    * The Newmark method utilizes parameters gamma and beta. Here, they are assumed constant as 0.5 and 0.25, respectively.

### Plot

The plot displays:

*   **Displacement vs. Time:** Shown as one curve (meters vs seconds).
*   **Velocity vs. Time:** Shown as another curve (meters/seconds vs seconds).

## Code Structure

*   `Newmark_method_in_Marine_structures_GUI.mlapp` (or `.m`): Main App Designer file that creates the GUI and its elements.
*   `runSimulation`: Callback function that runs the simulation based on the Newmark method and plots the results.

## Example

1.  Run the script:
    ```matlab
    Newmark_method_in_Marine_structures_GUI
    ```
2.  Input the following parameters:
    *   Wave length: 156
    *   Wave height: 11.1
    *   Water depth: 100
3.  Press **Run Simulation**.
4.  Observe the displacement and velocity plots on the axes.

---

## License  
This project is licensed under the MIT License. See the `LICENSE` file for details.  

---

## Contact  
For questions or feedback, please reach out to pouyazarbipour@gmail.com.

Enjoy using the **Newmark Model** to explore and analyze Marine Structures engineering scenarios!
