library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mmCSR_AXI4_slave_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface mmCSR_AXI4_s
		C_mmCSR_AXI4_s_DATA_WIDTH	: integer	:= 32;
		C_mmCSR_AXI4_s_ADDR_WIDTH	: integer	:= 16
	);
	port (
		-- Users to add ports here
        msip, mtip : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface mmCSR_AXI4_s
		S_AXI_aclk	: in std_logic;
		S_AXI_aresetn	: in std_logic;
		S_AXI_awaddr	: in std_logic_vector(C_mmCSR_AXI4_s_ADDR_WIDTH-1 downto 0);
		S_AXI_awprot	: in std_logic_vector(2 downto 0);
		S_AXI_awvalid	: in std_logic;
		S_AXI_awready	: out std_logic;
		S_AXI_wdata	: in std_logic_vector(C_mmCSR_AXI4_s_DATA_WIDTH-1 downto 0);
		S_AXI_wstrb	: in std_logic_vector((C_mmCSR_AXI4_s_DATA_WIDTH/8)-1 downto 0);
		S_AXI_wvalid	: in std_logic;
		S_AXI_wready	: out std_logic;
		S_AXI_bresp	: out std_logic_vector(1 downto 0);
		S_AXI_bvalid	: out std_logic;
		S_AXI_bready	: in std_logic;
		S_AXI_araddr	: in std_logic_vector(C_mmCSR_AXI4_s_ADDR_WIDTH-1 downto 0);
		S_AXI_arprot	: in std_logic_vector(2 downto 0);
		S_AXI_arvalid	: in std_logic;
		S_AXI_arready	: out std_logic;
		S_AXI_rdata	: out std_logic_vector(C_mmCSR_AXI4_s_DATA_WIDTH-1 downto 0);
		S_AXI_rresp	: out std_logic_vector(1 downto 0);
		S_AXI_rvalid	: out std_logic;
		S_AXI_rready	: in std_logic
	);
end mmCSR_AXI4_slave_v1_0;

architecture arch_imp of mmCSR_AXI4_slave_v1_0 is

	-- component declaration
	component mmCSR_AXI4_slave_v1_0_mmCSR_AXI4_s is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 16
		);
		port (
		mtime, mtimeh, mtimecmp, mtimecmph, msip : out std_logic_vector(31 downto 0);
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component mmCSR_AXI4_slave_v1_0_mmCSR_AXI4_s;
	
	signal mtime, mtimeh, mtimecmp, mtimecmph, msip_int : std_logic_vector(31 downto 0);

begin

-- Instantiation of Axi Bus Interface mmCSR_AXI4_s
mmCSR_AXI4_slave_v1_0_mmCSR_AXI4_s_inst : mmCSR_AXI4_slave_v1_0_mmCSR_AXI4_s
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_mmCSR_AXI4_s_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_mmCSR_AXI4_s_ADDR_WIDTH
	)
	port map (
	    mtime => mtime,
	    mtimeh => mtimeh,
	    mtimecmp => mtimecmp,
	    mtimecmph => mtimecmph,
	    msip => msip_int,
	    S_AXI_ACLK	=> S_AXI_aclk,
		S_AXI_ARESETN	=> S_AXI_aresetn,
		S_AXI_AWADDR	=> S_AXI_awaddr,
		S_AXI_AWPROT	=> S_AXI_awprot,
		S_AXI_AWVALID	=> S_AXI_awvalid,
		S_AXI_AWREADY	=> S_AXI_awready,
		S_AXI_WDATA	=> S_AXI_wdata,
		S_AXI_WSTRB	=> S_AXI_wstrb,
		S_AXI_WVALID	=> S_AXI_wvalid,
		S_AXI_WREADY	=> S_AXI_wready,
		S_AXI_BRESP	=> S_AXI_bresp,
		S_AXI_BVALID	=> S_AXI_bvalid,
		S_AXI_BREADY	=> S_AXI_bready,
		S_AXI_ARADDR	=> S_AXI_araddr,
		S_AXI_ARPROT	=> S_AXI_arprot,
		S_AXI_ARVALID	=> S_AXI_arvalid,
		S_AXI_ARREADY	=> S_AXI_arready,
		S_AXI_RDATA	=> S_AXI_rdata,
		S_AXI_RRESP	=> S_AXI_rresp,
		S_AXI_RVALID	=> S_AXI_rvalid,
		S_AXI_RREADY	=> S_AXI_rready
	);

	-- Add user logic here
	--generate one bit msip output
    msip <= '1' when msip_int = x"FFFFFFFF" else
            '0';
            
    --mtip comperator
    mtip <= '1' when mtimeh & mtime = mtimecmph & mtimecmp else
            '0';
	-- User logic ends

end arch_imp;
