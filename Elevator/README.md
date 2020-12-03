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
> [To view state machine click here](https://viewer.diagrams.net/?highlight=0000ff&edit=_blank&layers=1&nav=1&title=DSD_PRJ05.drawio#R7V1Zj9u2Fv41BnofZiBKopbH8Swt0LQIEOA2eQo0tmyrkS1X0mz99SUlUgtJ2xxZCydmErTWISXZ%2FA6%2Fs3CbWbfb11%2FTYL%2F5I1mG8cw0lq8z625mmqYDTfQ%2FLHkrJcA1vFKyTqMlkdWCL9G%2FIREaRPoULcOsVTFPkjiP9m3hItntwkXekgVpmry0q62SuP3WfbAOOcGXRRDz0r%2BiZb4hUuD4dcFvYbTekFd7plsWPAaLH%2Bs0edqR981M6774UxZvA%2Fos8kOzTbBMXhoi635m3aZJkpeftq%2B3YYwblzZbed%2FDgdLqe6fhLpe5wX%2F8Bt%2BiT3dfwx8P%2F0ZfPj89guWVSeDL8jfaIOEStQ%2B5TNJ8k6yTXRDf19J5Lf2UJHtUDSDh32GevxF4g6c8QaJNvo1JKfqO6dtXdGFcQ3r5DV%2FSi7vX1tUbuVo8pc%2FhkjwkDh7DeF41%2B20SJ2nxnWnDW%2FMsT5MfYaMEeOY9bo%2F5KtnlTfkN%2FovkfDOSls2Sp3QRHmk7qq1Bug7zY21c1sPt2ngBAenXMNmG6BejCmkYB3n03NbLgKj3uqpXQ4w%2BEJTfgTh57nMQP5E3bZPn8PvTHgmLawOpkROjHzR%2FTNGnNf5UVEHauztWCWGFG%2FH7Kk5QK1cVDz0uy4M8bFVjFTGOEQlghXvZRHn4ZR8UcLwgImorV5DtS2ZYRa9YWeaFelRqs4riuIH8A7yZQ0OkK76B%2F3bRlecwzcPXo%2BiSUpv8TkKXpkto5qXBPZQxNg3aqYS9K4QJR6KA1yj%2F2vj8rWYDdFX3f3xBu39NGy3SqDnkA9KGKUsbtlK8YZ7kDTAJbwBeey%2BANxwFeIO3JAv06Bmcgxm8O6YVM%2FcW%2F0O%2BXyKozaCJ2idvw9Zu%2F12yCxmwiCiIo%2FUOXS5Qq4dIPsetHSHP74YUbKPlMj6kJ4wuDIfsldOG1qIdvwGtK0DWGgxYT%2FuEncndlmV3dyp238C5%2Befq%2F5%2FvP%2F3%2BsPjH%2BO49ft1f%2BR0gb%2BFQdxfjTG0ATV0AJ3RB6FQcdSkGVBgGy4E1CBojKczRrzleHHHIvbhUf6BtNWwFHAKHU4nsJcoXG2TkzQs38oAx8i715xpw%2BQK0BgPLEvSTYY38TxTBuZIUTV00VUI4d%2BwYTnP2Mc5WIIizbO3rd6UB2rtP04CllK8PuuT8e3b23%2B22dwsPVHf2pVUI2lMaDvo1R3P2gU7%2BNQ2H67DOvncNJzcdfEa4cvetC3f3oamYu0%2Ffr939DiRtydr5yXJ6R7%2F3aO6%2BZu2jrO2owNpOl0xvjw7%2FKY9NaSKQjfsdTy0iOB339%2By%2BScb9FzLnAwDGHVBg1ofNj95W3pt94d6b56nmvfGWnAy1s1AdH2q%2FdGBBNZCuyli77Y5kjknCheZV3pFwaXnyH9l8y87XBH0b7%2BLWmzQN3hoV9km0y7PGkz9jQUNXGZPhu01lO1Xd8gCjm%2BX7a02tfsgZyjuWLzlStlBl5ZX2PfsPQrupL0u1JxWY4%2BaeVViYC%2B8y93WYVHiTmYGccrdzLCeUW%2FVUOJRNhZvnpsI76bMNvJZ22rZxVJ1P1B9Gm7tM3NMDO5NqM%2FTP1Oaz3E%2F6NZWbxXUhmQF2RoACiQG6oI%2BPNes5XCcDzVZVZaJMpGJRsiMMMt5YEOOaI8sgSAMLo87BZgB0mfylDcUghkJ2uq8z1gwAscZYymjMxTvKshpjTTpBHI49QVx29PFCXAt29NFUYfQR8lPEiXNhyTsXlnYu6qEKl3Uu5BLapkOVoXeM3bGygj%2FhCDP0Zb2ByWaWC90DR3sHqngHsho07fIx%2BjVVSzyAC%2FEO2MQDHfGezjVwx9qGQhhGfuwZio5strH3oc3z5qL1lH0UdG1NAh1I4Krq3RPOTzw41eXDpx9HCgksCNqBnwDUUee4uBPvJ%2FGRAwJHOj2o1n4SIgrVEcEkEYG0Ck27xsxRNF94Kc4Amy90%2FenThY5OF%2FYMMjveDEQoe6N6B6aO%2BzpTu%2BykQJpuUSXw62lBinTgp7n%2BKNfjwG96tnfH3pLmZ2ICTzZOUGtXUfq9x2MCnQI6ujRNhRyQy%2BeA9M4C1ToPiwFMkLofdXGaywduets3Uuq4qoF1ZI%2B%2BS9%2BI1wLTgSVOokEOLBL%2BRsh0BVvcOoUpK0hRIhQ%2BeFvvUMfhKh8SaA5VAfbSk2bGzJCLgea9IDHQZjeg2duyfbBrIe7885QUPlPZ4DfY%2F1s%2FBr8YmA%2FM29IL4z%2F9r6ALBImB0bpaBdsofitv3ya7JCvwbVXJCqccVzD2r%2FV7K58t2aJ%2Fq%2BXMhOyZMxC1J5YWB6ZUV7R9YdHCSHKHP%2BMvCHGLQgTLqbqgqktVqNNjzPoxJYxVSQGlCbE1RP8tZEZR2nhzCUV1S9EB0VXZBWnddjfE0qLX4YK6K7bEZXfEIsK9WNjulLiQdEtc2OiYuKTomlhOOycWGkRCcli1qNEEZf%2BUaeSqqGrfusdC3GermpZdA2K8NZreacjLPlyVeY0i0pfr%2BxplqE9X8nXj%2FSz6xWWlAk1hWzFJPUaDV0us22UnRExR9kPSgS%2BMhNllESaQWxRhD0bC%2FJQkCtUyehbSJYboirQ25rSiwTlSawBePKiiujbBr7sRvPA2ZQieFMk1lGZ%2Fzf4%2FOfuPR%2F7DB1tn0b%2FlWdf05Cm6P5po7rp5TScGjmIEaCSgjYA2AtoIaCOgjcCgRoA51Uy4egmMSf%2BmAvT%2F%2Fmye8DZN%2F5r%2BNf1r%2BleX%2Fl3DY2MA2fWr9NyS%2Fi0AP%2FasLYC2ANoCaAugLUD%2FFoBuQHYsBTTmIIDgWEs95D4A0JIj7sPhLDu1Qo%2B4a2urre2HtrZLPeJOhlxOc7AzJgcfnPX04Zd6d17ddd6UCsbIyp5uQA9u7h1hwbmBF79%2B7yyEfZNF2JLcS7SfDb%2FEKIuS5gxQrbUz4W55k6bJC27%2BOMiyaNHGcJC1NVkepDl9LVGCQvYQ4Z97Vy%2FB%2BIu0JKgwG3ffxkPrsBsIQwHCVPa%2BfdC5jcs9t71xuQWdagiePqX8reTGWntOPwu47QeVbcE96L2bs%2Ft0Q1v6Hvf4WQNsfeZsgmE2Zxccx6dgN%2BlT4Q1ZhTemVHgI7GvTty3DB57ru7bZViUHXEPbtF0bOo7lmH63ngCBde2Ynmf5tu%2F7NrNFi4VKbcvxDcO1fB8Cxh731Es498CtevbBr82G7T57y0B9RTYNY3cLz%2B0LTcMA4LcBBcINAEZNxQhOJxx%2FxAV0G3Fhb1MmzaNHXHQOSOeA9IgLZwGYABKKD6OoospxLACfCMoMCWj6avIi9PsR4lWwdfvTbSdqTztJl2HKoH7AByelPeDF5uwEB8TYonB%2FKKxE58byccz03UiIaaNPGcUfAdY9YGYz0xqFeyqMixqfosn4Ez00ak3UhBugjYuaYB8MmZDlAnnRmZwX%2BQHlzNY97GgPm96YCXbD4Lch16A1QbOF58iMCxufMcj4Eyg0bGoRpMDJ5w8%2Fv2zQPMGG7JN3Nn5ZfMZv6K1xU8t1FBzsmvHnMmnU2u7I5JYNCqJrwVaEGjfFPBLBobmZ4JBVjZtSLgkUxdc6mcUOGQo2C54YN8GOk4IDajVujHkbrLvNyDhMYw5APQJj3f8H)