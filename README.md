# Trabalho 1 de Sistemas Digitais - ULA

Projeto de uma ULA combinacional em SystemVerilog, com entradas de 8 bits e saída de 16 bits.

Operações: soma, subtração, multiplicação, comparação por igualdade, AND, OR, NOT e XOR.

## Testes

- [x] Somadores: 4 casos do half_adder, 8 do full_adder e 131.072 do adder8 passaram no Icarus.
- [X] Abrir o circuito importado no Logisim e conferir as operações e os 16 bits de saída.
- [x] ULA: 524.288 combinações, retorno a zero e dois seletores inválidos passaram no Icarus.
- [ ] Configurar os scripts de simulação e medir a cobertura no Questa/ModelSim.
- [ ] Após configurar a pinagem, validar esta versão no Vivado e na FPGA.
