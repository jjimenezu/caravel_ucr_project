//################################# start generate unrolling
//  for genvar = 1

//     always @* begin

//       rem[1] = rem_reg[1-1];
//       quoti[1] = quot_reg[1-1];

//       for (i = (((STAGES-1+1)*WIDTH)/STAGES)-1;i>=((STAGES-1)*WIDTH)/STAGES;i=i-1) begin

//         rem[1] = rem[1] << 1;
//         rem[1] = rem[1]+den_minus; // 2r-D


//         if(!(rem[1]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[1] == 0)) begin
//           quoti[1]= quoti[1]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[1]= quoti[1]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[1] = rem[1]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-1)*WIDTH)/STAGES) begin
//             donei[1] = done_reg[1-1];
//         end else begin
//             donei[1] =0;
//         end

//       end

//     end

// // for genvar = 2

//     always @* begin

//       rem[2] = rem_reg[2-1];
//       quoti[2] = quot_reg[2-1];

//       for (i = (((STAGES-2+1)*WIDTH)/STAGES)-1;i>=((STAGES-2)*WIDTH)/STAGES;i=i-1) begin

//         rem[2] = rem[2] << 1;
//         rem[2] = rem[2]+den_minus; // 2r-D


//         if(!(rem[2]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[2] == 0)) begin
//           quoti[2]= quoti[2]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[2]= quoti[2]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[2] = rem[2]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-2)*WIDTH)/STAGES) begin
//             donei[2] = done_reg[2-1];
//         end else begin
//             donei[2] =0;
//         end

//       end

//     end

// // for genvar  = 3

//     always @* begin

//       rem[3] = rem_reg[3-1];
//       quoti[3] = quot_reg[3-1];

//       for (i = (((STAGES-3+1)*WIDTH)/STAGES)-1;i>=((STAGES-3)*WIDTH)/STAGES;i=i-1) begin

//         rem[3] = rem[3] << 1;
//         rem[3] = rem[3]+den_minus; // 2r-D


//         if(!(rem[3]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[3] == 0)) begin
//           quoti[3]= quoti[3]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[3]= quoti[3]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[3] = rem[3]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-3)*WIDTH)/STAGES) begin
//             donei[3] = done_reg[3-1];
//         end else begin
//             donei[3] =0;
//         end

//       end

//     end


// // for genvar = 4

// always @* begin

//       rem[4] = rem_reg[4-1];
//       quoti[4] = quot_reg[4-1];

//       for (i = (((STAGES-4+1)*WIDTH)/STAGES)-1;i>=((STAGES-4)*WIDTH)/STAGES;i=i-1) begin

//         rem[4] = rem[4] << 1;
//         rem[4] = rem[4]+den_minus; // 2r-D


//         if(!(rem[4]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[4] == 0)) begin
//           quoti[4]= quoti[4]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[4]= quoti[4]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[4] = rem[4]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-4)*WIDTH)/STAGES) begin
//             donei[4] = done_reg[4-1];
//         end else begin
//             donei[4] =0;
//         end

//       end

//     end

// // for genvar = 5

// always @* begin

//       rem[5] = rem_reg[5-1];
//       quoti[5] = quot_reg[5-1];

//       for (i = (((STAGES-5+1)*WIDTH)/STAGES)-1;i>=((STAGES-5)*WIDTH)/STAGES;i=i-1) begin

//         rem[5] = rem[5] << 1;
//         rem[5] = rem[5]+den_minus; // 2r-D


//         if(!(rem[5]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[5] == 0)) begin
//           quoti[5]= quoti[5]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[5]= quoti[5]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[5] = rem[5]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-5)*WIDTH)/STAGES) begin
//             donei[5] = done_reg[5-1];
//         end else begin
//             donei[5] =0;
//         end

//       end

//     end


// // for genvar = 6
//   always @* begin

//       rem[6] = rem_reg[6-1];
//       quoti[6] = quot_reg[6-1];

//       for (i = (((STAGES-6+1)*WIDTH)/STAGES)-1;i>=((STAGES-6)*WIDTH)/STAGES;i=i-1) begin

//         rem[6] = rem[6] << 1;
//         rem[6] = rem[6]+den_minus; // 2r-D


//         if(!(rem[6]&({1'b1,{(WIDTH){1'b0}}}))||(|rem[6] == 0)) begin
//           quoti[6]= quoti[6]|({{(WIDTH-1){1'b0}},1'b1} << i); // q(i) = 1;

//         end
//         else begin
//           quoti[6]= quoti[6]&(~({{(WIDTH-1){1'b0}},1'b1} << i)); // q(i) = 0
//           rem[6] = rem[6]+den;// 2r + D   //this is the restoring step

//         end

//         if(i == ((STAGES-6)*WIDTH)/STAGES) begin
//             donei[6] = done_reg[6-1];
//         end else begin
//             donei[6] =0;
//         end

//       end

//     end

//     // If unroled
//     // j=1 to j=5

//       always @(posedge clk or negedge rst) begin
//         if(!rst) begin
//         {quot_reg[1],rem_reg[1],done_reg[1]} <= {27'b0,27'b0,1'b0};
//         {quot_reg[2],rem_reg[2],done_reg[2]} <= {27'b0,27'b0,1'b0};
//         {quot_reg[3],rem_reg[3],done_reg[3]} <= {27'b0,27'b0,1'b0};
//         {quot_reg[4],rem_reg[4],done_reg[4]} <= {27'b0,27'b0,1'b0};
//         {quot_reg[5],rem_reg[5],done_reg[5]} <= {27'b0,27'b0,1'b0}; 
//         end else begin
//         {quot_reg[1],rem_reg[1],done_reg[1]} <= {quoti[1],rem[1],donei[1]};
//         {quot_reg[2],rem_reg[2],done_reg[2]} <= {quoti[2],rem[2],donei[2]};
//         {quot_reg[3],rem_reg[3],done_reg[3]} <= {quoti[3],rem[3],donei[3]};
//         {quot_reg[4],rem_reg[4],done_reg[4]} <= {quoti[4],rem[4],donei[4]};
//         {quot_reg[5],rem_reg[5],done_reg[5]} <= {quoti[5],rem[5],donei[5]};
//         end
//       end
//##################################################### end unrolling


