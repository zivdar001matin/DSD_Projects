# 4-Floor Elevator


<!-- Table -->
<table>
  <tr>
    <th>Signal Name</th>
    <th>Port Type</th>
    <th># of Bits</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>come[i]</td>
    <td>Input</td>
    <td># of Floors</td>
    <td>Call the elevator to come.</td>
  </tr>
  <tr>
    <td>switch[i]</td>
    <td>Input</td>
    <td># of Floors</td>
    <td>Boolean corresponding to elevator available in floor[i].</td>
  </tr>
  <tr>
    <td>go[i]</td>
    <td>Input</td>
    <td># of Floors</td>
    <td>Button that tell the elevator to go to floor[i] from inside of cabin.</td>
  </tr>
  <tr>
    <td>motor_up</td>
    <td>Output</td>
    <td>1</td>
    <td>Motor goes up.</td>
  </tr>
  <tr>
    <td>motor_down</td>
    <td>Output</td>
    <td>1</td>
    <td>Motor goes down.</td>
  </tr>
  <tr>
    <td>current_floor</td>
    <td>Output</td>
    <td>2</td>
    <td>Shows current floor.</td>
  </tr>
  <tr>
    <td>move_state</td>
    <td>Output</td>
    <td>2</td>
    <td>Moving states: (00:Still), (01:GoingUp), (10:GoingDown).</td>
  </tr>
</table>

<!-- State Machine -->
> [To view state machine click here](https://b2n.ir/984446)