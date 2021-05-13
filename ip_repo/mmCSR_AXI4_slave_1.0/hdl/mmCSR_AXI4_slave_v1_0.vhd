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
		C_mmCSR_AXI4_s_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here
        msip, mtip : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface mmCSR_AXI4_s
		mmcsr_axi4_s_aclk	: in std_logic;
		mmcsr_axi4_s_aresetn	: in std_logic;
		mmcsr_axi4_s_awaddr	: in std_logic_vector(C_mmCSR_AXI4_s_ADDR_WIDTH-1 downto 0);
		mmcsr_axi4_s_awprot	: in std_logic_vector(2 downto 0);
		mmcsr_axi4_s_awvalid	: in std_logic;
		mmcsr_axi4_s_awready	: out std_logic;
		mmcsr_axi4_s_wdata	: in std_logic_vector(C_mmCSR_AXI4_s_DATA_WIDTH-1 downto 0);
		mmcsr_axi4_s_wstrb	: in std_logic_vector((C_mmCSR_AXI4_s_DATA_WIDTH/8)-1 downto 0);
		mmcsr_axi4_s_wvalid	: in std_logic;
		mmcsr_axi4_s_wready	: out std_logic;
		mmcsr_axi4_s_bresp	: out std_logic_vector(1 downto 0);
		mmcsr_axi4_s_bvalid	: out std_logic;
		mmcsr_axi4_s_bready	: in std_logic;
		mmcsr_axi4_s_araddr	: in std_logic_vector(C_mmCSR_AXI4_s_ADDR_WIDTH-1 downto 0);
		mmcsr_axi4_s_arprot	: in std_logic_vector(2 downto 0);
		mmcsr_axi4_s_arvalid	: in std_logic;
		mmcsr_axi4_s_arready	: out std_logic;
		mmcsr_axi4_s_rdata	: out std_logic_vector(C_mmCSR_AXI4_s_DATA_WIDTH-1 downto 0);
		mmcsr_axi4_s_rresp	: out std_logic_vector(1 downto 0);
		mmcsr_axi4_s_rvalid	: out std_logic;
		mmcsr_axi4_s_rready	: in std_logic
	);
end mmCSR_AXI4_slave_v1_0;

architecture arch_imp of mmCSR_AXI4_slave_v1_0 is

	-- component declaration
	component mmCSR_AXI4_slave_v1_0_mmCSR_AXI4_s is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5
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
	    S_AXI_ACLK	=> mmcsr_axi4_s_aclk,
		S_AXI_ARESETN	=> mmcsr_axi4_s_aresetn,
		S_AXI_AWADDR	=> mmcsr_axi4_s_awaddr,
		S_AXI_AWPROT	=> mmcsr_axi4_s_awprot,
		S_AXI_AWVALID	=> mmcsr_axi4_s_awvalid,
		S_AXI_AWREADY	=> mmcsr_axi4_s_awready,
		S_AXI_WDATA	=> mmcsr_axi4_s_wdata,
		S_AXI_WSTRB	=> mmcsr_axi4_s_wstrb,
		S_AXI_WVALID	=> mmcsr_axi4_s_wvalid,
		S_AXI_WREADY	=> mmcsr_axi4_s_wready,
		S_AXI_BRESP	=> mmcsr_axi4_s_bresp,
		S_AXI_BVALID	=> mmcsr_axi4_s_bvalid,
		S_AXI_BREADY	=> mmcsr_axi4_s_bready,
		S_AXI_ARADDR	=> mmcsr_axi4_s_araddr,
		S_AXI_ARPROT	=> mmcsr_axi4_s_arprot,
		S_AXI_ARVALID	=> mmcsr_axi4_s_arvalid,
		S_AXI_ARREADY	=> mmcsr_axi4_s_arready,
		S_AXI_RDATA	=> mmcsr_axi4_s_rdata,
		S_AXI_RRESP	=> mmcsr_axi4_s_rresp,
		S_AXI_RVALID	=> mmcsr_axi4_s_rvalid,
		S_AXI_RREADY	=> mmcsr_axi4_s_rready
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
