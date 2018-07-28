module forwarding (DataA, DataB, ALUOut, dataWrite, Rs, Rt, Dst1cc, Dst2cc, noRs, noRt, fwdedDataA, fwdedDataB);
	input [31:0] DataA, DataB, ALUOut, dataWrite;
	input [4:0] Rs, Rt, Dst1cc, Dst2cc;
	input noRs, noRt;
	output [31:0] fwdedDataA, fwdedDataB;
	wire [1:0] fwdRsMuxCtrl, fwdRtMuxCtrl, rsCtrl, rtCtrl;
	wire [31:0] fwdRsTemp, fwdRtTemp;
	
	fwdTest ftRs(Rs, Dst1cc, Dst2cc, rsCtrl);
	fwdTest ftRt(Rt, Dst1cc, Dst2cc, rtCtrl);
	mux2 m1 (noRs, rsCtrl[1], 1'b0, fwdRsMuxCtrl[1]);
	mux2 m2 (noRs, rsCtrl[0], 1'b0, fwdRsMuxCtrl[0]);
	mux2 m3 (noRt, rtCtrl[1], 1'b0, fwdRtMuxCtrl[1]);
	mux2 m4 (noRt, rtCtrl[0], 1'b0, fwdRtMuxCtrl[0]);
	mux2x32 fwdRsMux1 (fwdRsMuxCtrl[1], DataA, ALUOut, fwdRsTemp);
	mux2x32 fwdRsMux2 (fwdRsMuxCtrl[0], fwdRsTemp, dataWrite, fwdedDataA);
	mux2x32 fwdRtMux1 (fwdRtMuxCtrl[1], DataB, ALUOut, fwdRtTemp);
	mux2x32 fwdRtMux2 (fwdRtMuxCtrl[0], fwdRtTemp, dataWrite, fwdedDataB);
	
endmodule 