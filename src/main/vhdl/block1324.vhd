-------------------------------------------------------------------------------
--  Copyright (C) 2017, Xilinx, Inc.
--  All rights reserved.
--
--  Author: Thomas B. Preusser <thomas.preusser@utexas.edu>
--          Marie-Curie Fellow, Xilinx Ireland, Grant Agreement No. 751339
--
--  This project has received funding from the European Union's Framework
--  Programme for Research and Innovation Horizon 2020 (2014-2020) under
--  the Marie Sklodowska-Curie Grant Agreement No. 751339.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity block1324 is
  port (
    -- Bit Inputs
    x0 : in  std_logic_vector(3 downto 0);
    x1 : in  std_logic_vector(1 downto 0);
    x2 : in  std_logic_vector(2 downto 0);
    x3 : in  std_logic;

    -- Carry-Chain MUX Control Outputs
    d  : out std_logic_vector(3 downto 0);
    s  : out std_logic_vector(3 downto 0)
  );
end entity block1324;


library UNISIM;
use UNISIM.vcomponents.all;

architecture xil of block1324 is
begin

  lut0 : LUT6_2
    generic map (
      INIT => x"6996_6996" & x"FF00_FF00"
    )
    port map (
      O6 => s(0),
      O5 => d(0),
      I5 => '1',
      I4 => '0',
      I3 => x0(3),
      I2 => x0(2),
      I1 => x0(1),
      I0 => x0(0)
    );

  lut1 : LUT6_2
    generic map (
      INIT => x"E817_17E8" & x"E8E8_E8E8"
    )
    port map (
      O6 => s(1),
      O5 => d(1),
      I5 => '1',
      I4 => x1(1),
      I3 => x1(0),
      I2 => x0(2),
      I1 => x0(1),
      I0 => x0(0)
    );

  lut2 : LUT6_2
    generic map (
      INIT => x"7887_8778" & x"F00F_0FF0"
    )
    port map (
      O6 => s(2),
      O5 => d(2),
      I5 => '1',
      I4 => x2(2),
      I3 => x2(1),
      I2 => x2(0),
      I1 => x1(1),
      I0 => x1(0)
    );

  lut3 : LUT6_2
    generic map (
      INIT => x"17E8_17E8" & x"FF00_FF00"
    )
    port map (
      O6 => s(3),
      O5 => d(3),
      I5 => '1',
      I4 => '0',
      I3 => x3,
      I2 => x2(2),
      I1 => x2(1),
      I0 => x2(0)
    );

end xil;
