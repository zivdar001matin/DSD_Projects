# 32-bit Universal Barrel Shifter
Implementing barrel shifter that do Logical/Artihmetic/Circular shifts in both left/right directions.
<table>
<thead>
  <tr>
    <th>Input</th>
    <th>Function</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>sham</td>
    <td>number of shift bits</td>
  </tr>
  <tr>
    <td rowspan="4">shty</td>
    <td>00: Logical Shift</td>
  </tr>
  <tr>
    <td>01: Arithmetic Shift</td>
  </tr>
  <tr>
    <td>10: Circular Shift</td>
  </tr>
  <tr>
    <td>11: Parallel Load</td>
  </tr>
  <tr>
    <td rowspan="2">dir</td>
    <td>0: Right to Left</td>
  </tr>
  <tr>
    <td>1: Left to Right</td>
  </tr>
</tbody>
</table>
