// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_AXIS_CYCLE_MON_TRN_SV__
`define __UVMA_AXIS_CYCLE_MON_TRN_SV__


/**
 * Object rebuilt from the AMBA Advanced Extensible Interface Stream monitor.
 * Analog of uvma_axis_seq_item_c.
 */
class uvma_axis_cycle_mon_trn_c extends uvml_trn_mon_trn_c;
   
   // Data
   logic                                     tready;
   logic                              [7:0]  tdata[];
   logic  [(`UVMA_AXIS_TDATA_MAX_SIZE-1):0]  tstrb ;
   logic  [(`UVMA_AXIS_TDATA_MAX_SIZE-1):0]  tkeep ;
   logic                                     tlast ;
   logic  [(  `UVMA_AXIS_TID_MAX_SIZE-1):0]  tid   ;
   logic  [(`UVMA_AXIS_TDEST_MAX_SIZE-1):0]  tdest ;
   logic  [(`UVMA_AXIS_TUSER_MAX_SIZE-1):0]  tuser ;
   
   // Metadata
   int unsigned  tid_width  ;
   int unsigned  tdest_width;
   int unsigned  tuser_width;
   
   
   `uvm_object_utils_begin(uvma_axis_cycle_mon_trn_c)
      `uvm_field_int      (tready, UVM_DEFAULT              )
      `uvm_field_array_int(tdata , UVM_DEFAULT              )
      `uvm_field_int      (tstrb , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int      (tkeep , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int      (tlast , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int      (tid   , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int      (tdest , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int      (tuser , UVM_DEFAULT + UVM_NOPRINT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_axis_cycle_mon_trn");
   
   /**
    * TODO Describe uvma_axis_cycle_mon_trn_c::do_print()
    */
   extern function void do_print(uvm_printer printer);
   
endclass : uvma_axis_cycle_mon_trn_c


function uvma_axis_cycle_mon_trn_c::new(string name="uvma_axis_cycle_mon_trn");
   
   super.new(name);
   
endfunction : new


function void uvma_axis_cycle_mon_trn_c::do_print(uvm_printer printer);
   
   super.do_print(printer);
   
   if (tdata.size() != 0) begin
      printer.print_field("tstrb", tstrb, tdata.size(), UVM_BIN);
      printer.print_field("tkeep", tkeep, tdata.size(), UVM_BIN);
   end
   
   printer.print_field("tlast", tlast, $bits(tlast));
   
   if (tid_width != 0) begin
      printer.print_field("tid", tid, tid_width);
   end
   
   if (tdest_width != 0) begin
      printer.print_field("tdest", tdest, tdest_width);
   end
   
   if (tuser_width != 0) begin
      printer.print_field("tuser", tuser, tuser_width);
   end
   
endfunction : do_print


`endif // __UVMA_AXIS_CYCLE_MON_TRN_SV__
