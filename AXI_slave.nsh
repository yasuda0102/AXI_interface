declare AXI_slave interface {
    // AXI4-Lite signals
    // Global signals
    input ACLK;
    input ARESETn;

    // Write address cha\nel signals
    input AWVALID;
    output AWREADY;
    input AWADDR[32];
    input AWPROT[3];

    // Write data channel signals
    input WVALID;
    output WREADY;
    input WDATA[64];
    input WSTRB[8];

    // Write response channel signals
    output BVALID;
    input BREADY;
    output BRESP[2];

    // Read address channel signals
    input ARVALID;
    output ARREADY;
    input ARADDR[32];
    input ARPROT[3];

    // Read data channel signals
    input RVALID;
    output RREADY;
    input RDATA[64];
    input RRESP[2];

    // Control signals
    output addr[32];
    output wdata[64];
    output rdata[64];
    output strobe[8];

    func_out wreq(addr, wdata, strobe);
    func_out rreq(addr, rdata);
}