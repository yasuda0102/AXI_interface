declare AXI_master interface {
    // AXI4-Lite signals
    // Global signals
    input ACLK;
    input ARESETn;

    // Write address channel signals
    output AWVALID;
    input AWREADY;
    output AWADDR[32];
    output AWPROT[3];

    // Write data channel signals
    output WVALID;
    input WREADY;
    output WDATA[64];
    output WSTRB[8];

    // Write response channel signals
    input BVALID;
    output BREADY;
    input BRESP[2];

    // Read address channel signals
    output ARVALID;
    input ARREADY;
    output ARADDR[32];
    output ARPROT[3];

    // Read data channel signals
    input RVALID;
    output RREADY;
    input RDATA[64];
    input RRESP[2];


    // Control signals
    // Read
    input raddr[32];
    output rdata[64];
    output rstatus;

    func_in read(raddr);
    func_out finish_r(rdata, rstatus);

    // Write
    input waddr[32];
    input wdata[64];
    input wstrobe[8];
    output wstatus;

    func_in write(waddr, wdata, wstrobe);
    func_out finish_w(wstatus);
}