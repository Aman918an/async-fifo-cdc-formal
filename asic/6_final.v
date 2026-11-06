module async_fifo (empty,
    full,
    read_clk,
    read_en,
    rst_n,
    write_clk,
    write_en,
    read_data,
    write_data);
 output empty;
 output full;
 input read_clk;
 input read_en;
 input rst_n;
 input write_clk;
 input write_en;
 output [7:0] read_data;
 input [7:0] write_data;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire net25;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _103_;
 wire _104_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _115_;
 wire _116_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _122_;
 wire _123_;
 wire _125_;
 wire _128_;
 wire _129_;
 wire _131_;
 wire _133_;
 wire _136_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _157_;
 wire _158_;
 wire clknet_3_0__leaf_write_clk;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire clknet_0_write_clk;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _207_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;
 wire _222_;
 wire _223_;
 wire _224_;
 wire _225_;
 wire _226_;
 wire _227_;
 wire _228_;
 wire _229_;
 wire _230_;
 wire _231_;
 wire _232_;
 wire _233_;
 wire _234_;
 wire _235_;
 wire _236_;
 wire _237_;
 wire _238_;
 wire _239_;
 wire _240_;
 wire _241_;
 wire _242_;
 wire _243_;
 wire _244_;
 wire _245_;
 wire _246_;
 wire _247_;
 wire _248_;
 wire _249_;
 wire _250_;
 wire _251_;
 wire _252_;
 wire _253_;
 wire _254_;
 wire _255_;
 wire _256_;
 wire _257_;
 wire _258_;
 wire _259_;
 wire _260_;
 wire _261_;
 wire _262_;
 wire _263_;
 wire _264_;
 wire _265_;
 wire _266_;
 wire _267_;
 wire _268_;
 wire _269_;
 wire _270_;
 wire _271_;
 wire _272_;
 wire _273_;
 wire _274_;
 wire _275_;
 wire _276_;
 wire _277_;
 wire _278_;
 wire _279_;
 wire _280_;
 wire _281_;
 wire _282_;
 wire _283_;
 wire _284_;
 wire _285_;
 wire _286_;
 wire _287_;
 wire _288_;
 wire _289_;
 wire _290_;
 wire _291_;
 wire _292_;
 wire _293_;
 wire _294_;
 wire _295_;
 wire _296_;
 wire _297_;
 wire _298_;
 wire _299_;
 wire _300_;
 wire _301_;
 wire _302_;
 wire _303_;
 wire _304_;
 wire _305_;
 wire _306_;
 wire _307_;
 wire _308_;
 wire _309_;
 wire _310_;
 wire _311_;
 wire _312_;
 wire _313_;
 wire _314_;
 wire _315_;
 wire _316_;
 wire _317_;
 wire _318_;
 wire _319_;
 wire _320_;
 wire _321_;
 wire _322_;
 wire _323_;
 wire _324_;
 wire _325_;
 wire _326_;
 wire _327_;
 wire _328_;
 wire _329_;
 wire _330_;
 wire _331_;
 wire _332_;
 wire _333_;
 wire _334_;
 wire _335_;
 wire _336_;
 wire _337_;
 wire _338_;
 wire _339_;
 wire _340_;
 wire _341_;
 wire _342_;
 wire _343_;
 wire _344_;
 wire _345_;
 wire _346_;
 wire _347_;
 wire _348_;
 wire _349_;
 wire _350_;
 wire _351_;
 wire _352_;
 wire _353_;
 wire _354_;
 wire _355_;
 wire _356_;
 wire _357_;
 wire _358_;
 wire _359_;
 wire _360_;
 wire _361_;
 wire _362_;
 wire _363_;
 wire _364_;
 wire _365_;
 wire _366_;
 wire _367_;
 wire _368_;
 wire _369_;
 wire _370_;
 wire _371_;
 wire _372_;
 wire _373_;
 wire _374_;
 wire _375_;
 wire _376_;
 wire _377_;
 wire _378_;
 wire _379_;
 wire _380_;
 wire _381_;
 wire _382_;
 wire _383_;
 wire _384_;
 wire _385_;
 wire _386_;
 wire _387_;
 wire _388_;
 wire _389_;
 wire _390_;
 wire _391_;
 wire _392_;
 wire _393_;
 wire _394_;
 wire _395_;
 wire _396_;
 wire _397_;
 wire _398_;
 wire _399_;
 wire _400_;
 wire _401_;
 wire _402_;
 wire _403_;
 wire _404_;
 wire _405_;
 wire _406_;
 wire _407_;
 wire _408_;
 wire _409_;
 wire _410_;
 wire _411_;
 wire _412_;
 wire _413_;
 wire _414_;
 wire _415_;
 wire _416_;
 wire _417_;
 wire _418_;
 wire _419_;
 wire _420_;
 wire _421_;
 wire _422_;
 wire _423_;
 wire _424_;
 wire _425_;
 wire _426_;
 wire _427_;
 wire _428_;
 wire _429_;
 wire _430_;
 wire _431_;
 wire _432_;
 wire net12;
 wire empty_next;
 wire net13;
 wire full_next;
 wire net24;
 wire mem_write_en;
 wire \memory_inst.mem[0][0] ;
 wire \memory_inst.mem[0][1] ;
 wire \memory_inst.mem[0][2] ;
 wire \memory_inst.mem[0][3] ;
 wire \memory_inst.mem[0][4] ;
 wire \memory_inst.mem[0][5] ;
 wire \memory_inst.mem[0][6] ;
 wire \memory_inst.mem[0][7] ;
 wire \memory_inst.mem[1][0] ;
 wire \memory_inst.mem[1][1] ;
 wire \memory_inst.mem[1][2] ;
 wire \memory_inst.mem[1][3] ;
 wire \memory_inst.mem[1][4] ;
 wire \memory_inst.mem[1][5] ;
 wire \memory_inst.mem[1][6] ;
 wire \memory_inst.mem[1][7] ;
 wire \memory_inst.mem[2][0] ;
 wire \memory_inst.mem[2][1] ;
 wire \memory_inst.mem[2][2] ;
 wire \memory_inst.mem[2][3] ;
 wire \memory_inst.mem[2][4] ;
 wire \memory_inst.mem[2][5] ;
 wire \memory_inst.mem[2][6] ;
 wire \memory_inst.mem[2][7] ;
 wire \memory_inst.mem[3][0] ;
 wire \memory_inst.mem[3][1] ;
 wire \memory_inst.mem[3][2] ;
 wire \memory_inst.mem[3][3] ;
 wire \memory_inst.mem[3][4] ;
 wire \memory_inst.mem[3][5] ;
 wire \memory_inst.mem[3][6] ;
 wire \memory_inst.mem[3][7] ;
 wire \memory_inst.mem[4][0] ;
 wire \memory_inst.mem[4][1] ;
 wire \memory_inst.mem[4][2] ;
 wire \memory_inst.mem[4][3] ;
 wire \memory_inst.mem[4][4] ;
 wire \memory_inst.mem[4][5] ;
 wire \memory_inst.mem[4][6] ;
 wire \memory_inst.mem[4][7] ;
 wire \memory_inst.mem[5][0] ;
 wire \memory_inst.mem[5][1] ;
 wire \memory_inst.mem[5][2] ;
 wire \memory_inst.mem[5][3] ;
 wire \memory_inst.mem[5][4] ;
 wire \memory_inst.mem[5][5] ;
 wire \memory_inst.mem[5][6] ;
 wire \memory_inst.mem[5][7] ;
 wire \memory_inst.mem[6][0] ;
 wire \memory_inst.mem[6][1] ;
 wire \memory_inst.mem[6][2] ;
 wire \memory_inst.mem[6][3] ;
 wire \memory_inst.mem[6][4] ;
 wire \memory_inst.mem[6][5] ;
 wire \memory_inst.mem[6][6] ;
 wire \memory_inst.mem[6][7] ;
 wire \memory_inst.mem[7][0] ;
 wire \memory_inst.mem[7][1] ;
 wire \memory_inst.mem[7][2] ;
 wire \memory_inst.mem[7][3] ;
 wire \memory_inst.mem[7][4] ;
 wire \memory_inst.mem[7][5] ;
 wire \memory_inst.mem[7][6] ;
 wire \memory_inst.mem[7][7] ;
 wire \memory_inst.read_addr[0] ;
 wire \memory_inst.read_addr[1] ;
 wire \memory_inst.read_addr[2] ;
 wire \memory_inst.write_addr[0] ;
 wire \memory_inst.write_addr[1] ;
 wire \memory_inst.write_addr[2] ;
 wire \rd_gray_current.binary[3] ;
 wire \rd_gray_current.gray[0] ;
 wire \rd_gray_current.gray[1] ;
 wire \rd_gray_current.gray[2] ;
 wire \rd_gray_next.binary[0] ;
 wire \rd_gray_next.binary[1] ;
 wire \rd_gray_next.binary[2] ;
 wire \rd_gray_next.binary[3] ;
 wire \rd_to_wr_sync.gray_out[0] ;
 wire \rd_to_wr_sync.gray_out[1] ;
 wire \rd_to_wr_sync.gray_out[2] ;
 wire \rd_to_wr_sync.gray_out[3] ;
 wire \rd_to_wr_sync.sync_ff1[0] ;
 wire \rd_to_wr_sync.sync_ff1[1] ;
 wire \rd_to_wr_sync.sync_ff1[2] ;
 wire \rd_to_wr_sync.sync_ff1[3] ;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net1;
 wire net2;
 wire \status_inst.synced_wr_ptr_gray[0] ;
 wire \status_inst.synced_wr_ptr_gray[1] ;
 wire \status_inst.synced_wr_ptr_gray[2] ;
 wire \status_inst.synced_wr_ptr_gray[3] ;
 wire \status_inst.wr_ptr_gray_next[3] ;
 wire \wr_gray_current.binary[3] ;
 wire \wr_gray_current.gray[0] ;
 wire \wr_gray_current.gray[1] ;
 wire \wr_gray_current.gray[2] ;
 wire \wr_gray_next.binary[0] ;
 wire \wr_gray_next.binary[1] ;
 wire \wr_gray_next.binary[2] ;
 wire \wr_to_rd_sync.sync_ff1[0] ;
 wire \wr_to_rd_sync.sync_ff1[1] ;
 wire \wr_to_rd_sync.sync_ff1[2] ;
 wire \wr_to_rd_sync.sync_ff1[3] ;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire clknet_3_1__leaf_write_clk;
 wire clknet_3_2__leaf_write_clk;
 wire clknet_3_3__leaf_write_clk;
 wire clknet_3_4__leaf_write_clk;
 wire clknet_3_5__leaf_write_clk;
 wire clknet_3_6__leaf_write_clk;
 wire clknet_3_7__leaf_write_clk;
 wire clknet_0_read_clk;
 wire clknet_1_0__leaf_read_clk;
 wire clknet_1_1__leaf_read_clk;

 XNOR2_X1 _433_ (.A(\memory_inst.write_addr[1] ),
    .B(_004_),
    .ZN(_089_));
 INV_X1 _434_ (.A(_089_),
    .ZN(\wr_gray_next.binary[1] ));
 INV_X4 _435_ (.A(_001_),
    .ZN(mem_write_en));
 MUX2_X1 _437_ (.A(\memory_inst.mem[7][4] ),
    .B(net7),
    .S(_094_),
    .Z(_069_));
 NAND2_X1 _438_ (.A1(_104_),
    .A2(net9),
    .ZN(_161_));
 INV_X1 _439_ (.A(\memory_inst.mem[1][6] ),
    .ZN(_162_));
 OAI21_X1 _440_ (.A(_161_),
    .B1(_162_),
    .B2(_104_),
    .ZN(_068_));
 NAND2_X1 _441_ (.A1(_152_),
    .A2(\status_inst.synced_wr_ptr_gray[2] ),
    .ZN(_163_));
 INV_X1 _442_ (.A(\status_inst.synced_wr_ptr_gray[2] ),
    .ZN(_164_));
 NAND3_X1 _443_ (.A1(_149_),
    .A2(_151_),
    .A3(_164_),
    .ZN(_165_));
 NAND2_X1 _444_ (.A1(_163_),
    .A2(_165_),
    .ZN(_166_));
 NAND2_X1 _445_ (.A1(_166_),
    .A2(\status_inst.synced_wr_ptr_gray[3] ),
    .ZN(_167_));
 NAND2_X4 _446_ (.A1(net1),
    .A2(_000_),
    .ZN(_014_));
 NAND3_X1 _447_ (.A1(_163_),
    .A2(_165_),
    .A3(_099_),
    .ZN(_168_));
 NAND2_X1 _448_ (.A1(_167_),
    .A2(_168_),
    .ZN(_169_));
 INV_X1 _449_ (.A(_169_),
    .ZN(_170_));
 XNOR2_X1 _450_ (.A(\memory_inst.read_addr[1] ),
    .B(\status_inst.synced_wr_ptr_gray[0] ),
    .ZN(_171_));
 XNOR2_X1 _451_ (.A(_171_),
    .B(_015_),
    .ZN(_172_));
 INV_X1 _452_ (.A(\status_inst.synced_wr_ptr_gray[3] ),
    .ZN(_173_));
 OAI21_X1 _453_ (.A(_172_),
    .B1(_173_),
    .B2(\rd_gray_next.binary[3] ),
    .ZN(_174_));
 INV_X1 _454_ (.A(_174_),
    .ZN(_175_));
 INV_X1 _455_ (.A(_012_),
    .ZN(\rd_gray_current.gray[0] ));
 NAND2_X1 _456_ (.A1(_095_),
    .A2(\rd_gray_current.gray[0] ),
    .ZN(_176_));
 INV_X4 _457_ (.A(_014_),
    .ZN(_095_));
 NAND2_X1 _458_ (.A1(_014_),
    .A2(\memory_inst.read_addr[1] ),
    .ZN(_177_));
 NAND2_X1 _459_ (.A1(_176_),
    .A2(_177_),
    .ZN(\rd_gray_next.binary[1] ));
 INV_X1 _460_ (.A(\status_inst.synced_wr_ptr_gray[1] ),
    .ZN(_178_));
 NAND2_X1 _461_ (.A1(\rd_gray_next.binary[1] ),
    .A2(_178_),
    .ZN(_179_));
 NAND3_X1 _462_ (.A1(_176_),
    .A2(\status_inst.synced_wr_ptr_gray[1] ),
    .A3(_177_),
    .ZN(_180_));
 NAND2_X1 _463_ (.A1(_179_),
    .A2(_180_),
    .ZN(_181_));
 NAND2_X1 _464_ (.A1(_181_),
    .A2(\rd_gray_next.binary[2] ),
    .ZN(_182_));
 NAND3_X1 _465_ (.A1(_179_),
    .A2(_152_),
    .A3(_180_),
    .ZN(_183_));
 NAND2_X1 _466_ (.A1(_182_),
    .A2(_183_),
    .ZN(_184_));
 NAND2_X1 _467_ (.A1(_175_),
    .A2(_184_),
    .ZN(_185_));
 NOR2_X2 _469_ (.A1(_170_),
    .A2(_185_),
    .ZN(empty_next));
 NAND2_X1 _470_ (.A1(_104_),
    .A2(net8),
    .ZN(_186_));
 INV_X1 _471_ (.A(\memory_inst.mem[1][5] ),
    .ZN(_187_));
 OAI21_X1 _472_ (.A(_186_),
    .B1(_187_),
    .B2(_104_),
    .ZN(_067_));
 OR2_X1 _473_ (.A1(\memory_inst.read_addr[0] ),
    .A2(\memory_inst.mem[0][0] ),
    .ZN(_188_));
 INV_X1 _474_ (.A(\memory_inst.mem[1][0] ),
    .ZN(_189_));
 NAND2_X1 _475_ (.A1(_189_),
    .A2(\memory_inst.read_addr[0] ),
    .ZN(_190_));
 NAND3_X1 _476_ (.A1(_188_),
    .A2(_190_),
    .A3(_125_),
    .ZN(_191_));
 NAND2_X1 _477_ (.A1(_013_),
    .A2(\memory_inst.mem[3][0] ),
    .ZN(_192_));
 NAND2_X1 _480_ (.A1(\memory_inst.mem[2][0] ),
    .A2(_011_),
    .ZN(_194_));
 NAND4_X1 _481_ (.A1(_191_),
    .A2(_133_),
    .A3(_192_),
    .A4(_194_),
    .ZN(_195_));
 OR2_X1 _482_ (.A1(_128_),
    .A2(\memory_inst.mem[5][0] ),
    .ZN(_196_));
 OR2_X1 _483_ (.A1(\memory_inst.read_addr[0] ),
    .A2(\memory_inst.mem[4][0] ),
    .ZN(_197_));
 NAND3_X1 _484_ (.A1(_196_),
    .A2(_197_),
    .A3(_125_),
    .ZN(_198_));
 INV_X1 _485_ (.A(\memory_inst.mem[6][0] ),
    .ZN(_199_));
 INV_X1 _486_ (.A(_011_),
    .ZN(_200_));
 OAI21_X1 _487_ (.A(\memory_inst.read_addr[2] ),
    .B1(_199_),
    .B2(_200_),
    .ZN(_201_));
 INV_X1 _488_ (.A(_201_),
    .ZN(_202_));
 NAND2_X1 _489_ (.A1(_013_),
    .A2(\memory_inst.mem[7][0] ),
    .ZN(_203_));
 MUX2_X1 _490_ (.A(\memory_inst.mem[7][1] ),
    .B(net4),
    .S(_094_),
    .Z(_088_));
 NAND3_X1 _491_ (.A1(_198_),
    .A2(_202_),
    .A3(_203_),
    .ZN(_204_));
 NAND3_X1 _492_ (.A1(_195_),
    .A2(_095_),
    .A3(_204_),
    .ZN(_205_));
 INV_X1 _493_ (.A(net14),
    .ZN(_206_));
 OAI21_X1 _494_ (.A(_205_),
    .B1(_206_),
    .B2(_095_),
    .ZN(_066_));
 OR2_X1 _495_ (.A1(\memory_inst.read_addr[0] ),
    .A2(\memory_inst.mem[0][1] ),
    .ZN(_207_));
 INV_X1 _496_ (.A(\memory_inst.mem[1][1] ),
    .ZN(_208_));
 NAND2_X1 _497_ (.A1(_208_),
    .A2(\memory_inst.read_addr[0] ),
    .ZN(_209_));
 NAND3_X1 _498_ (.A1(_207_),
    .A2(_209_),
    .A3(_125_),
    .ZN(_210_));
 NAND2_X1 _499_ (.A1(\memory_inst.mem[2][1] ),
    .A2(_011_),
    .ZN(_211_));
 NAND2_X1 _500_ (.A1(_013_),
    .A2(\memory_inst.mem[3][1] ),
    .ZN(_212_));
 NAND2_X1 _501_ (.A1(_016_),
    .A2(_010_),
    .ZN(_097_));
 NAND4_X1 _502_ (.A1(_210_),
    .A2(_133_),
    .A3(_211_),
    .A4(_212_),
    .ZN(_213_));
 INV_X1 _503_ (.A(\memory_inst.mem[4][1] ),
    .ZN(_214_));
 NAND2_X1 _504_ (.A1(_128_),
    .A2(_214_),
    .ZN(_215_));
 INV_X1 _505_ (.A(\memory_inst.mem[5][1] ),
    .ZN(_216_));
 NAND2_X1 _506_ (.A1(_216_),
    .A2(\memory_inst.read_addr[0] ),
    .ZN(_217_));
 NAND3_X1 _507_ (.A1(_215_),
    .A2(_217_),
    .A3(_125_),
    .ZN(_218_));
 NAND2_X1 _508_ (.A1(_013_),
    .A2(\memory_inst.mem[7][1] ),
    .ZN(_219_));
 NAND2_X1 _509_ (.A1(\memory_inst.mem[6][1] ),
    .A2(_011_),
    .ZN(_220_));
 NAND4_X1 _510_ (.A1(_218_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_219_),
    .A4(_220_),
    .ZN(_221_));
 NAND3_X1 _511_ (.A1(_213_),
    .A2(_221_),
    .A3(_095_),
    .ZN(_222_));
 INV_X1 _512_ (.A(\rd_gray_current.binary[3] ),
    .ZN(_098_));
 INV_X1 _513_ (.A(net15),
    .ZN(_223_));
 OAI21_X1 _514_ (.A(_222_),
    .B1(_223_),
    .B2(_095_),
    .ZN(_065_));
 NOR2_X1 _515_ (.A1(net24),
    .A2(\memory_inst.mem[0][2] ),
    .ZN(_224_));
 NOR2_X1 _516_ (.A1(_224_),
    .A2(\memory_inst.read_addr[1] ),
    .ZN(_225_));
 OAI21_X1 _517_ (.A(_225_),
    .B1(_128_),
    .B2(\memory_inst.mem[1][2] ),
    .ZN(_226_));
 NAND2_X1 _518_ (.A1(_013_),
    .A2(\memory_inst.mem[3][2] ),
    .ZN(_227_));
 NAND2_X1 _519_ (.A1(_011_),
    .A2(\memory_inst.mem[2][2] ),
    .ZN(_228_));
 NAND4_X1 _520_ (.A1(_226_),
    .A2(_133_),
    .A3(_227_),
    .A4(_228_),
    .ZN(_229_));
 INV_X1 _521_ (.A(\memory_inst.mem[6][2] ),
    .ZN(_230_));
 AOI21_X1 _522_ (.A(_125_),
    .B1(_128_),
    .B2(_230_),
    .ZN(_231_));
 XNOR2_X1 _523_ (.A(_097_),
    .B(_098_),
    .ZN(_099_));
 OAI21_X1 _524_ (.A(_231_),
    .B1(_128_),
    .B2(\memory_inst.mem[7][2] ),
    .ZN(_232_));
 INV_X1 _525_ (.A(\memory_inst.mem[5][2] ),
    .ZN(_233_));
 AOI21_X1 _526_ (.A(\memory_inst.read_addr[1] ),
    .B1(_233_),
    .B2(net24),
    .ZN(_234_));
 OAI21_X1 _527_ (.A(_234_),
    .B1(net24),
    .B2(\memory_inst.mem[4][2] ),
    .ZN(_235_));
 NAND3_X1 _528_ (.A1(_232_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_235_),
    .ZN(_236_));
 NAND3_X1 _529_ (.A1(_229_),
    .A2(_236_),
    .A3(_095_),
    .ZN(_237_));
 NAND2_X1 _530_ (.A1(_014_),
    .A2(net16),
    .ZN(_238_));
 NAND2_X1 _531_ (.A1(_237_),
    .A2(_238_),
    .ZN(_064_));
 NOR2_X1 _532_ (.A1(net24),
    .A2(\memory_inst.mem[0][3] ),
    .ZN(_239_));
 NOR2_X1 _533_ (.A1(_239_),
    .A2(\memory_inst.read_addr[1] ),
    .ZN(_240_));
 INV_X1 _534_ (.A(_099_),
    .ZN(\rd_gray_next.binary[3] ));
 OAI21_X1 _535_ (.A(_240_),
    .B1(_128_),
    .B2(\memory_inst.mem[1][3] ),
    .ZN(_241_));
 NAND2_X1 _536_ (.A1(_013_),
    .A2(\memory_inst.mem[3][3] ),
    .ZN(_242_));
 NAND2_X1 _537_ (.A1(_011_),
    .A2(\memory_inst.mem[2][3] ),
    .ZN(_243_));
 NAND4_X1 _538_ (.A1(_241_),
    .A2(_133_),
    .A3(_242_),
    .A4(_243_),
    .ZN(_244_));
 INV_X1 _539_ (.A(\memory_inst.mem[6][3] ),
    .ZN(_245_));
 AOI21_X1 _540_ (.A(_125_),
    .B1(_128_),
    .B2(_245_),
    .ZN(_246_));
 OAI21_X1 _541_ (.A(_246_),
    .B1(_128_),
    .B2(\memory_inst.mem[7][3] ),
    .ZN(_247_));
 INV_X1 _542_ (.A(\memory_inst.mem[5][3] ),
    .ZN(_248_));
 AOI21_X1 _543_ (.A(\memory_inst.read_addr[1] ),
    .B1(_248_),
    .B2(net24),
    .ZN(_249_));
 OAI21_X1 _544_ (.A(_249_),
    .B1(net24),
    .B2(\memory_inst.mem[4][3] ),
    .ZN(_250_));
 INV_X1 _545_ (.A(\wr_gray_current.binary[3] ),
    .ZN(_090_));
 NAND3_X1 _547_ (.A1(_247_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_250_),
    .ZN(_251_));
 NAND3_X1 _548_ (.A1(_244_),
    .A2(_251_),
    .A3(_095_),
    .ZN(_252_));
 NAND2_X1 _549_ (.A1(_014_),
    .A2(net17),
    .ZN(_253_));
 NAND2_X1 _550_ (.A1(_252_),
    .A2(_253_),
    .ZN(_063_));
 NOR2_X1 _551_ (.A1(net24),
    .A2(\memory_inst.mem[0][4] ),
    .ZN(_254_));
 NOR2_X1 _552_ (.A1(_254_),
    .A2(\memory_inst.read_addr[1] ),
    .ZN(_255_));
 OAI21_X1 _553_ (.A(_255_),
    .B1(_128_),
    .B2(\memory_inst.mem[1][4] ),
    .ZN(_256_));
 NAND2_X1 _554_ (.A1(_013_),
    .A2(\memory_inst.mem[3][4] ),
    .ZN(_257_));
 NAND2_X1 _555_ (.A1(_011_),
    .A2(\memory_inst.mem[2][4] ),
    .ZN(_258_));
 NAND4_X1 _556_ (.A1(_256_),
    .A2(_133_),
    .A3(_257_),
    .A4(_258_),
    .ZN(_259_));
 MUX2_X1 _557_ (.A(\memory_inst.mem[7][6] ),
    .B(net9),
    .S(_094_),
    .Z(_087_));
 INV_X1 _558_ (.A(\memory_inst.mem[6][4] ),
    .ZN(_260_));
 AOI21_X1 _559_ (.A(_125_),
    .B1(_128_),
    .B2(_260_),
    .ZN(_261_));
 OAI21_X1 _560_ (.A(_261_),
    .B1(_128_),
    .B2(\memory_inst.mem[7][4] ),
    .ZN(_262_));
 INV_X1 _561_ (.A(\memory_inst.mem[5][4] ),
    .ZN(_263_));
 AOI21_X1 _562_ (.A(\memory_inst.read_addr[1] ),
    .B1(_263_),
    .B2(net24),
    .ZN(_264_));
 OAI21_X1 _563_ (.A(_264_),
    .B1(net24),
    .B2(\memory_inst.mem[4][4] ),
    .ZN(_265_));
 NAND3_X1 _564_ (.A1(_262_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_265_),
    .ZN(_266_));
 NAND3_X1 _565_ (.A1(_259_),
    .A2(_266_),
    .A3(_095_),
    .ZN(_267_));
 NAND2_X1 _566_ (.A1(_014_),
    .A2(net18),
    .ZN(_268_));
 NAND2_X1 _567_ (.A1(_267_),
    .A2(_268_),
    .ZN(_062_));
 INV_X1 _569_ (.A(\memory_inst.mem[6][5] ),
    .ZN(_269_));
 AOI21_X1 _570_ (.A(_125_),
    .B1(_269_),
    .B2(_128_),
    .ZN(_270_));
 OAI21_X1 _571_ (.A(_270_),
    .B1(\memory_inst.mem[7][5] ),
    .B2(_128_),
    .ZN(_271_));
 AOI21_X1 _572_ (.A(\memory_inst.read_addr[1] ),
    .B1(_158_),
    .B2(net24),
    .ZN(_272_));
 OAI21_X1 _573_ (.A(_272_),
    .B1(net24),
    .B2(\memory_inst.mem[4][5] ),
    .ZN(_273_));
 NAND3_X1 _574_ (.A1(_271_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_273_),
    .ZN(_274_));
 OR2_X1 _575_ (.A1(\memory_inst.read_addr[0] ),
    .A2(\memory_inst.mem[0][5] ),
    .ZN(_275_));
 NAND2_X1 _576_ (.A1(_187_),
    .A2(\memory_inst.read_addr[0] ),
    .ZN(_276_));
 NAND3_X1 _577_ (.A1(_275_),
    .A2(_276_),
    .A3(_125_),
    .ZN(_277_));
 NAND2_X1 _578_ (.A1(_013_),
    .A2(\memory_inst.mem[3][5] ),
    .ZN(_278_));
 NAND2_X1 _580_ (.A1(_011_),
    .A2(\memory_inst.mem[2][5] ),
    .ZN(_279_));
 NAND4_X1 _581_ (.A1(_277_),
    .A2(_133_),
    .A3(_278_),
    .A4(_279_),
    .ZN(_280_));
 NAND3_X1 _582_ (.A1(_274_),
    .A2(_280_),
    .A3(_095_),
    .ZN(_281_));
 NAND2_X1 _583_ (.A1(_014_),
    .A2(net19),
    .ZN(_282_));
 NAND2_X1 _584_ (.A1(_281_),
    .A2(_282_),
    .ZN(_061_));
 INV_X1 _585_ (.A(\memory_inst.mem[6][6] ),
    .ZN(_283_));
 AOI21_X1 _586_ (.A(_125_),
    .B1(_128_),
    .B2(_283_),
    .ZN(_284_));
 OAI21_X1 _587_ (.A(_284_),
    .B1(_128_),
    .B2(\memory_inst.mem[7][6] ),
    .ZN(_285_));
 AOI21_X1 _588_ (.A(\memory_inst.read_addr[1] ),
    .B1(_154_),
    .B2(net24),
    .ZN(_286_));
 OAI21_X1 _589_ (.A(_286_),
    .B1(net24),
    .B2(\memory_inst.mem[4][6] ),
    .ZN(_287_));
 NAND2_X1 _590_ (.A1(_006_),
    .A2(_003_),
    .ZN(_103_));
 NAND3_X1 _591_ (.A1(_285_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_287_),
    .ZN(_288_));
 OR2_X1 _592_ (.A1(\memory_inst.read_addr[0] ),
    .A2(\memory_inst.mem[0][6] ),
    .ZN(_289_));
 NAND2_X1 _593_ (.A1(_162_),
    .A2(\memory_inst.read_addr[0] ),
    .ZN(_290_));
 NAND3_X1 _594_ (.A1(_289_),
    .A2(_290_),
    .A3(_125_),
    .ZN(_291_));
 NAND2_X1 _595_ (.A1(_011_),
    .A2(\memory_inst.mem[2][6] ),
    .ZN(_292_));
 NAND2_X1 _596_ (.A1(_013_),
    .A2(\memory_inst.mem[3][6] ),
    .ZN(_293_));
 NAND4_X1 _597_ (.A1(_291_),
    .A2(_133_),
    .A3(_292_),
    .A4(_293_),
    .ZN(_294_));
 NAND3_X1 _598_ (.A1(_288_),
    .A2(_294_),
    .A3(_095_),
    .ZN(_295_));
 NAND2_X1 _599_ (.A1(_014_),
    .A2(net20),
    .ZN(_296_));
 NAND2_X1 _600_ (.A1(_295_),
    .A2(_296_),
    .ZN(_060_));
 MUX2_X1 _601_ (.A(net10),
    .B(\memory_inst.mem[0][7] ),
    .S(_103_),
    .Z(_086_));
 NOR2_X1 _602_ (.A1(_120_),
    .A2(net9),
    .ZN(_297_));
 AOI21_X1 _603_ (.A(_297_),
    .B1(_283_),
    .B2(_120_),
    .ZN(_059_));
 NOR2_X1 _604_ (.A1(_120_),
    .A2(net8),
    .ZN(_298_));
 AOI21_X1 _605_ (.A(_298_),
    .B1(_269_),
    .B2(_120_),
    .ZN(_058_));
 NOR2_X1 _606_ (.A1(_120_),
    .A2(net7),
    .ZN(_299_));
 AOI21_X1 _607_ (.A(_299_),
    .B1(_260_),
    .B2(_120_),
    .ZN(_057_));
 NOR2_X1 _608_ (.A1(_120_),
    .A2(net6),
    .ZN(_300_));
 AOI21_X1 _609_ (.A(_300_),
    .B1(_245_),
    .B2(_120_),
    .ZN(_056_));
 NOR2_X1 _610_ (.A1(_120_),
    .A2(net5),
    .ZN(_301_));
 AOI21_X1 _611_ (.A(_301_),
    .B1(_230_),
    .B2(_120_),
    .ZN(_055_));
 AND3_X2 _612_ (.A1(mem_write_en),
    .A2(_006_),
    .A3(\memory_inst.write_addr[0] ),
    .ZN(_104_));
 MUX2_X1 _613_ (.A(net4),
    .B(\memory_inst.mem[6][1] ),
    .S(_120_),
    .Z(_054_));
 NOR2_X1 _614_ (.A1(_120_),
    .A2(net3),
    .ZN(_302_));
 AOI21_X1 _615_ (.A(_302_),
    .B1(_199_),
    .B2(_120_),
    .ZN(_053_));
 MUX2_X1 _616_ (.A(\memory_inst.mem[1][4] ),
    .B(net7),
    .S(_104_),
    .Z(_052_));
 MUX2_X1 _617_ (.A(\memory_inst.mem[1][3] ),
    .B(net6),
    .S(_104_),
    .Z(_051_));
 MUX2_X1 _618_ (.A(\memory_inst.mem[1][2] ),
    .B(net5),
    .S(_104_),
    .Z(_050_));
 NAND2_X1 _619_ (.A1(_104_),
    .A2(net4),
    .ZN(_303_));
 OAI21_X1 _620_ (.A(_303_),
    .B1(_208_),
    .B2(_104_),
    .ZN(_049_));
 NAND2_X1 _621_ (.A1(_104_),
    .A2(net3),
    .ZN(_304_));
 OAI21_X1 _622_ (.A(_304_),
    .B1(_189_),
    .B2(_104_),
    .ZN(_048_));
 MUX2_X1 _624_ (.A(net9),
    .B(\memory_inst.mem[0][6] ),
    .S(_103_),
    .Z(_047_));
 MUX2_X1 _625_ (.A(net8),
    .B(\memory_inst.mem[0][5] ),
    .S(_103_),
    .Z(_046_));
 MUX2_X1 _626_ (.A(net7),
    .B(\memory_inst.mem[0][4] ),
    .S(_103_),
    .Z(_045_));
 MUX2_X1 _627_ (.A(net6),
    .B(\memory_inst.mem[0][3] ),
    .S(_103_),
    .Z(_044_));
 MUX2_X1 _628_ (.A(net5),
    .B(\memory_inst.mem[0][2] ),
    .S(_103_),
    .Z(_043_));
 MUX2_X1 _629_ (.A(net4),
    .B(\memory_inst.mem[0][1] ),
    .S(_103_),
    .Z(_042_));
 MUX2_X1 _630_ (.A(net3),
    .B(\memory_inst.mem[0][0] ),
    .S(_103_),
    .Z(_041_));
 NAND2_X1 _631_ (.A1(_116_),
    .A2(net7),
    .ZN(_305_));
 OAI21_X1 _632_ (.A(_305_),
    .B1(_263_),
    .B2(_116_),
    .ZN(_040_));
 NAND2_X1 _633_ (.A1(_116_),
    .A2(net6),
    .ZN(_306_));
 NAND2_X1 _634_ (.A1(_104_),
    .A2(net10),
    .ZN(_106_));
 OAI21_X1 _635_ (.A(_306_),
    .B1(_248_),
    .B2(_116_),
    .ZN(_039_));
 NAND2_X1 _636_ (.A1(_116_),
    .A2(net5),
    .ZN(_307_));
 OAI21_X1 _637_ (.A(_307_),
    .B1(_233_),
    .B2(_116_),
    .ZN(_038_));
 NAND2_X1 _638_ (.A1(_116_),
    .A2(net4),
    .ZN(_308_));
 OAI21_X1 _639_ (.A(_308_),
    .B1(_216_),
    .B2(_116_),
    .ZN(_037_));
 MUX2_X1 _640_ (.A(\memory_inst.mem[5][0] ),
    .B(net3),
    .S(_116_),
    .Z(_036_));
 MUX2_X1 _641_ (.A(net9),
    .B(\memory_inst.mem[4][6] ),
    .S(_115_),
    .Z(_035_));
 MUX2_X1 _642_ (.A(net8),
    .B(\memory_inst.mem[4][5] ),
    .S(_115_),
    .Z(_034_));
 MUX2_X1 _643_ (.A(net7),
    .B(\memory_inst.mem[4][4] ),
    .S(_115_),
    .Z(_033_));
 MUX2_X1 _644_ (.A(net6),
    .B(\memory_inst.mem[4][3] ),
    .S(_115_),
    .Z(_032_));
 INV_X1 _645_ (.A(\memory_inst.mem[1][7] ),
    .ZN(_107_));
 MUX2_X1 _646_ (.A(net5),
    .B(\memory_inst.mem[4][2] ),
    .S(_115_),
    .Z(_031_));
 NOR2_X1 _647_ (.A1(_115_),
    .A2(net4),
    .ZN(_309_));
 AOI21_X1 _648_ (.A(_309_),
    .B1(_214_),
    .B2(_115_),
    .ZN(_030_));
 MUX2_X1 _649_ (.A(net3),
    .B(\memory_inst.mem[4][0] ),
    .S(_115_),
    .Z(_029_));
 MUX2_X1 _650_ (.A(net9),
    .B(\memory_inst.mem[3][6] ),
    .S(_113_),
    .Z(_028_));
 MUX2_X1 _651_ (.A(net8),
    .B(\memory_inst.mem[3][5] ),
    .S(_113_),
    .Z(_027_));
 MUX2_X1 _652_ (.A(net7),
    .B(\memory_inst.mem[3][4] ),
    .S(_113_),
    .Z(_026_));
 MUX2_X1 _653_ (.A(net6),
    .B(\memory_inst.mem[3][3] ),
    .S(_113_),
    .Z(_025_));
 MUX2_X1 _654_ (.A(net5),
    .B(\memory_inst.mem[3][2] ),
    .S(_113_),
    .Z(_024_));
 MUX2_X1 _655_ (.A(net4),
    .B(\memory_inst.mem[3][1] ),
    .S(_113_),
    .Z(_023_));
 OAI21_X1 _657_ (.A(_106_),
    .B1(_107_),
    .B2(_104_),
    .ZN(_085_));
 MUX2_X1 _658_ (.A(net3),
    .B(\memory_inst.mem[3][0] ),
    .S(_113_),
    .Z(_022_));
 MUX2_X1 _659_ (.A(net9),
    .B(\memory_inst.mem[2][6] ),
    .S(_108_),
    .Z(_021_));
 MUX2_X1 _660_ (.A(net8),
    .B(\memory_inst.mem[2][5] ),
    .S(_108_),
    .Z(_020_));
 MUX2_X1 _661_ (.A(net5),
    .B(\memory_inst.mem[2][2] ),
    .S(_108_),
    .Z(_019_));
 MUX2_X1 _662_ (.A(net7),
    .B(\memory_inst.mem[2][4] ),
    .S(_108_),
    .Z(_018_));
 MUX2_X1 _663_ (.A(net6),
    .B(\memory_inst.mem[2][3] ),
    .S(_108_),
    .Z(_017_));
 NAND3_X1 _664_ (.A1(_092_),
    .A2(_005_),
    .A3(net11),
    .ZN(_310_));
 NAND2_X1 _665_ (.A1(_310_),
    .A2(\memory_inst.write_addr[2] ),
    .ZN(_311_));
 NAND2_X1 _666_ (.A1(_311_),
    .A2(_113_),
    .ZN(\wr_gray_next.binary[2] ));
 INV_X1 _667_ (.A(\rd_to_wr_sync.gray_out[2] ),
    .ZN(_312_));
 NAND2_X1 _668_ (.A1(_003_),
    .A2(_008_),
    .ZN(_108_));
 NAND2_X1 _669_ (.A1(\wr_gray_next.binary[2] ),
    .A2(_312_),
    .ZN(_313_));
 NAND3_X1 _670_ (.A1(_311_),
    .A2(\rd_to_wr_sync.gray_out[2] ),
    .A3(_113_),
    .ZN(_314_));
 NAND2_X1 _671_ (.A1(_313_),
    .A2(_314_),
    .ZN(_315_));
 NAND2_X1 _672_ (.A1(_315_),
    .A2(\status_inst.wr_ptr_gray_next[3] ),
    .ZN(_316_));
 NAND3_X1 _673_ (.A1(_313_),
    .A2(_314_),
    .A3(\rd_to_wr_sync.gray_out[3] ),
    .ZN(_317_));
 NAND3_X4 _674_ (.A1(_311_),
    .A2(_089_),
    .A3(_113_),
    .ZN(_318_));
 NAND2_X1 _675_ (.A1(\wr_gray_next.binary[1] ),
    .A2(\memory_inst.write_addr[2] ),
    .ZN(_319_));
 NAND2_X2 _676_ (.A1(_318_),
    .A2(_319_),
    .ZN(_320_));
 NAND2_X1 _677_ (.A1(_320_),
    .A2(\rd_to_wr_sync.gray_out[1] ),
    .ZN(_321_));
 NAND3_X2 _678_ (.A1(_316_),
    .A2(_317_),
    .A3(_321_),
    .ZN(_322_));
 NOR2_X1 _679_ (.A1(_108_),
    .A2(net10),
    .ZN(_109_));
 XNOR2_X1 _680_ (.A(_002_),
    .B(\rd_to_wr_sync.gray_out[0] ),
    .ZN(_323_));
 XNOR2_X1 _681_ (.A(_323_),
    .B(\memory_inst.write_addr[1] ),
    .ZN(_324_));
 OAI21_X1 _682_ (.A(_324_),
    .B1(\status_inst.wr_ptr_gray_next[3] ),
    .B2(\rd_to_wr_sync.gray_out[3] ),
    .ZN(_325_));
 INV_X1 _683_ (.A(_325_),
    .ZN(_326_));
 OR2_X1 _684_ (.A1(_320_),
    .A2(\rd_to_wr_sync.gray_out[1] ),
    .ZN(_327_));
 NAND2_X2 _685_ (.A1(_326_),
    .A2(_327_),
    .ZN(_328_));
 NOR2_X2 _686_ (.A1(_322_),
    .A2(_328_),
    .ZN(full_next));
 INV_X1 _687_ (.A(\memory_inst.mem[2][7] ),
    .ZN(_110_));
 AOI21_X1 _688_ (.A(_109_),
    .B1(_110_),
    .B2(_108_),
    .ZN(_084_));
 INV_X1 _689_ (.A(_005_),
    .ZN(_111_));
 NOR2_X2 _690_ (.A1(_111_),
    .A2(\memory_inst.write_addr[2] ),
    .ZN(_112_));
 NAND2_X2 _691_ (.A1(mem_write_en),
    .A2(_112_),
    .ZN(_113_));
 MUX2_X1 _693_ (.A(net10),
    .B(\memory_inst.mem[3][7] ),
    .S(_113_),
    .Z(_083_));
 XNOR2_X1 _694_ (.A(_090_),
    .B(\memory_inst.write_addr[2] ),
    .ZN(\wr_gray_current.gray[2] ));
 NAND2_X1 _695_ (.A1(_003_),
    .A2(_007_),
    .ZN(_115_));
 MUX2_X1 _696_ (.A(net10),
    .B(\memory_inst.mem[4][7] ),
    .S(_115_),
    .Z(_082_));
 AND3_X2 _697_ (.A1(mem_write_en),
    .A2(_007_),
    .A3(\memory_inst.write_addr[0] ),
    .ZN(_116_));
 NAND2_X1 _699_ (.A1(_116_),
    .A2(net10),
    .ZN(_118_));
 INV_X1 _700_ (.A(\memory_inst.mem[5][7] ),
    .ZN(_119_));
 OAI21_X1 _701_ (.A(_118_),
    .B1(_119_),
    .B2(_116_),
    .ZN(_081_));
 NAND2_X1 _702_ (.A1(_003_),
    .A2(_009_),
    .ZN(_120_));
 NOR2_X1 _704_ (.A1(_120_),
    .A2(net10),
    .ZN(_122_));
 INV_X2 _705_ (.A(net13),
    .ZN(_092_));
 INV_X1 _706_ (.A(\memory_inst.mem[6][7] ),
    .ZN(_123_));
 AOI21_X1 _707_ (.A(_122_),
    .B1(_123_),
    .B2(_120_),
    .ZN(_080_));
 MUX2_X1 _708_ (.A(\memory_inst.mem[7][7] ),
    .B(net10),
    .S(_094_),
    .Z(_079_));
 INV_X1 _710_ (.A(\memory_inst.read_addr[1] ),
    .ZN(_125_));
 INV_X2 _713_ (.A(\memory_inst.read_addr[0] ),
    .ZN(_128_));
 AOI21_X1 _714_ (.A(_125_),
    .B1(_128_),
    .B2(_110_),
    .ZN(_129_));
 NAND2_X4 _716_ (.A1(_092_),
    .A2(net11),
    .ZN(_001_));
 OAI21_X1 _717_ (.A(_129_),
    .B1(_128_),
    .B2(\memory_inst.mem[3][7] ),
    .ZN(_131_));
 INV_X4 _719_ (.A(\memory_inst.read_addr[2] ),
    .ZN(_133_));
 AOI21_X1 _722_ (.A(\memory_inst.read_addr[1] ),
    .B1(_107_),
    .B2(net24),
    .ZN(_136_));
 OAI21_X1 _724_ (.A(_136_),
    .B1(net24),
    .B2(\memory_inst.mem[0][7] ),
    .ZN(_138_));
 NAND3_X1 _725_ (.A1(_131_),
    .A2(_133_),
    .A3(_138_),
    .ZN(_139_));
 AOI21_X1 _726_ (.A(_125_),
    .B1(_128_),
    .B2(_123_),
    .ZN(_140_));
 NAND2_X4 _727_ (.A1(\memory_inst.write_addr[2] ),
    .A2(_005_),
    .ZN(_093_));
 OAI21_X1 _728_ (.A(_140_),
    .B1(_128_),
    .B2(\memory_inst.mem[7][7] ),
    .ZN(_141_));
 AOI21_X1 _729_ (.A(\memory_inst.read_addr[1] ),
    .B1(_119_),
    .B2(net24),
    .ZN(_142_));
 OAI21_X1 _730_ (.A(_142_),
    .B1(net24),
    .B2(\memory_inst.mem[4][7] ),
    .ZN(_143_));
 NAND3_X1 _731_ (.A1(_141_),
    .A2(\memory_inst.read_addr[2] ),
    .A3(_143_),
    .ZN(_144_));
 NAND3_X1 _732_ (.A1(_139_),
    .A2(_144_),
    .A3(_095_),
    .ZN(_145_));
 NAND2_X1 _733_ (.A1(_014_),
    .A2(net21),
    .ZN(_146_));
 NAND2_X1 _734_ (.A1(_145_),
    .A2(_146_),
    .ZN(_078_));
 MUX2_X1 _736_ (.A(\memory_inst.mem[7][0] ),
    .B(net3),
    .S(_094_),
    .Z(_077_));
 MUX2_X1 _737_ (.A(net4),
    .B(\memory_inst.mem[2][1] ),
    .S(_108_),
    .Z(_076_));
 NOR2_X4 _738_ (.A1(_001_),
    .A2(_093_),
    .ZN(_094_));
 MUX2_X1 _739_ (.A(net3),
    .B(\memory_inst.mem[2][0] ),
    .S(_108_),
    .Z(_075_));
 XNOR2_X1 _740_ (.A(_133_),
    .B(\rd_gray_current.binary[3] ),
    .ZN(\rd_gray_current.gray[2] ));
 NAND3_X1 _742_ (.A1(_095_),
    .A2(_013_),
    .A3(\memory_inst.read_addr[2] ),
    .ZN(_149_));
 INV_X1 _743_ (.A(_013_),
    .ZN(_150_));
 OAI21_X2 _744_ (.A(_133_),
    .B1(_014_),
    .B2(_150_),
    .ZN(_151_));
 NAND2_X1 _745_ (.A1(_149_),
    .A2(_151_),
    .ZN(_152_));
 INV_X1 _746_ (.A(_152_),
    .ZN(\rd_gray_next.binary[2] ));
 NAND2_X1 _747_ (.A1(_116_),
    .A2(net9),
    .ZN(_153_));
 INV_X1 _748_ (.A(\memory_inst.mem[5][6] ),
    .ZN(_154_));
 XNOR2_X2 _749_ (.A(_094_),
    .B(_090_),
    .ZN(\status_inst.wr_ptr_gray_next[3] ));
 OAI21_X1 _750_ (.A(_153_),
    .B1(_154_),
    .B2(_116_),
    .ZN(_074_));
 MUX2_X1 _752_ (.A(\memory_inst.mem[7][3] ),
    .B(net6),
    .S(_094_),
    .Z(_073_));
 NAND2_X1 _754_ (.A1(_116_),
    .A2(net8),
    .ZN(_157_));
 INV_X1 _755_ (.A(\memory_inst.mem[5][5] ),
    .ZN(_158_));
 OAI21_X1 _756_ (.A(_157_),
    .B1(_158_),
    .B2(_116_),
    .ZN(_072_));
 MUX2_X1 _757_ (.A(\memory_inst.mem[7][5] ),
    .B(net8),
    .S(_094_),
    .Z(_071_));
 MUX2_X1 _759_ (.A(\memory_inst.mem[7][2] ),
    .B(net5),
    .S(_094_),
    .Z(_070_));
 HA_X1 _760_ (.A(_001_),
    .B(_422_),
    .CO(_002_),
    .S(\wr_gray_next.binary[0] ));
 HA_X1 _761_ (.A(mem_write_en),
    .B(_422_),
    .CO(_003_),
    .S(_423_));
 HA_X1 _762_ (.A(mem_write_en),
    .B(\memory_inst.write_addr[0] ),
    .CO(_004_),
    .S(_424_));
 HA_X1 _763_ (.A(\memory_inst.write_addr[0] ),
    .B(\memory_inst.write_addr[1] ),
    .CO(_005_),
    .S(\wr_gray_current.gray[0] ));
 HA_X1 _764_ (.A(_425_),
    .B(_426_),
    .CO(_006_),
    .S(\wr_gray_current.gray[1] ));
 HA_X1 _765_ (.A(_425_),
    .B(\memory_inst.write_addr[2] ),
    .CO(_007_),
    .S(_427_));
 HA_X1 _766_ (.A(\memory_inst.write_addr[1] ),
    .B(_426_),
    .CO(_008_),
    .S(_428_));
 HA_X1 _767_ (.A(\memory_inst.write_addr[1] ),
    .B(\memory_inst.write_addr[2] ),
    .CO(_009_),
    .S(_429_));
 HA_X1 _768_ (.A(\memory_inst.read_addr[1] ),
    .B(\memory_inst.read_addr[2] ),
    .CO(_010_),
    .S(\rd_gray_current.gray[1] ));
 HA_X1 _769_ (.A(_430_),
    .B(\memory_inst.read_addr[1] ),
    .CO(_011_),
    .S(_012_));
 HA_X1 _770_ (.A(\memory_inst.read_addr[0] ),
    .B(\memory_inst.read_addr[1] ),
    .CO(_013_),
    .S(_431_));
 HA_X1 _771_ (.A(_014_),
    .B(_430_),
    .CO(_015_),
    .S(\rd_gray_next.binary[0] ));
 HA_X1 _772_ (.A(_095_),
    .B(\memory_inst.read_addr[0] ),
    .CO(_016_),
    .S(_432_));
 CLKBUF_X3 clkbuf_0_read_clk (.A(read_clk),
    .Z(clknet_0_read_clk));
 CLKBUF_X3 clkbuf_0_write_clk (.A(write_clk),
    .Z(clknet_0_write_clk));
 CLKBUF_X3 clkbuf_1_0__f_read_clk (.A(clknet_0_read_clk),
    .Z(clknet_1_0__leaf_read_clk));
 CLKBUF_X3 clkbuf_1_1__f_read_clk (.A(clknet_0_read_clk),
    .Z(clknet_1_1__leaf_read_clk));
 CLKBUF_X3 clkbuf_3_0__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_0__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_1__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_1__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_2__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_2__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_3__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_3__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_4__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_4__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_5__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_5__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_6__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_6__leaf_write_clk));
 CLKBUF_X3 clkbuf_3_7__f_write_clk (.A(clknet_0_write_clk),
    .Z(clknet_3_7__leaf_write_clk));
 INV_X2 clkload0 (.A(clknet_3_0__leaf_write_clk));
 INV_X2 clkload1 (.A(clknet_3_1__leaf_write_clk));
 INV_X1 clkload2 (.A(clknet_3_2__leaf_write_clk));
 INV_X2 clkload3 (.A(clknet_3_3__leaf_write_clk));
 INV_X2 clkload4 (.A(clknet_3_5__leaf_write_clk));
 INV_X1 clkload5 (.A(clknet_3_6__leaf_write_clk));
 INV_X1 clkload6 (.A(clknet_3_7__leaf_write_clk));
 INV_X2 clkload7 (.A(clknet_1_1__leaf_read_clk));
 DFFS_X1 \empty$_DFF_PN1_  (.D(empty_next),
    .SN(net2),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net12),
    .QN(_000_));
 DFFR_X1 \full$_DFF_PN0_  (.D(full_next),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(net13),
    .QN(_331_));
 BUF_X1 input1 (.A(read_en),
    .Z(net1));
 BUF_X1 input10 (.A(write_data[7]),
    .Z(net10));
 BUF_X1 input11 (.A(write_en),
    .Z(net11));
 BUF_X1 input2 (.A(rst_n),
    .Z(net2));
 BUF_X1 input3 (.A(write_data[0]),
    .Z(net3));
 BUF_X1 input4 (.A(write_data[1]),
    .Z(net4));
 BUF_X1 input5 (.A(write_data[2]),
    .Z(net5));
 BUF_X1 input6 (.A(write_data[3]),
    .Z(net6));
 BUF_X1 input7 (.A(write_data[4]),
    .Z(net7));
 BUF_X1 input8 (.A(write_data[5]),
    .Z(net8));
 BUF_X1 input9 (.A(write_data[6]),
    .Z(net9));
 DFF_X1 \memory_inst.mem[0][0]$_DFFE_PP_  (.D(_041_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[0][0] ),
    .QN(_376_));
 DFF_X1 \memory_inst.mem[0][1]$_DFFE_PP_  (.D(_042_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[0][1] ),
    .QN(_375_));
 DFF_X1 \memory_inst.mem[0][2]$_DFFE_PP_  (.D(_043_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[0][2] ),
    .QN(_374_));
 DFF_X1 \memory_inst.mem[0][3]$_DFFE_PP_  (.D(_044_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[0][3] ),
    .QN(_373_));
 DFF_X1 \memory_inst.mem[0][4]$_DFFE_PP_  (.D(_045_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[0][4] ),
    .QN(_372_));
 DFF_X1 \memory_inst.mem[0][5]$_DFFE_PP_  (.D(_046_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[0][5] ),
    .QN(_371_));
 DFF_X1 \memory_inst.mem[0][6]$_DFFE_PP_  (.D(_047_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[0][6] ),
    .QN(_370_));
 DFF_X1 \memory_inst.mem[0][7]$_DFFE_PP_  (.D(_086_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[0][7] ),
    .QN(_414_));
 DFF_X1 \memory_inst.mem[1][0]$_DFFE_PP_  (.D(_048_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[1][0] ),
    .QN(_369_));
 DFF_X1 \memory_inst.mem[1][1]$_DFFE_PP_  (.D(_049_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[1][1] ),
    .QN(_368_));
 DFF_X1 \memory_inst.mem[1][2]$_DFFE_PP_  (.D(_050_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[1][2] ),
    .QN(_367_));
 DFF_X1 \memory_inst.mem[1][3]$_DFFE_PP_  (.D(_051_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[1][3] ),
    .QN(_366_));
 DFF_X1 \memory_inst.mem[1][4]$_DFFE_PP_  (.D(_052_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[1][4] ),
    .QN(_365_));
 DFF_X1 \memory_inst.mem[1][5]$_DFFE_PP_  (.D(_067_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[1][5] ),
    .QN(_411_));
 DFF_X1 \memory_inst.mem[1][6]$_DFFE_PP_  (.D(_068_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[1][6] ),
    .QN(_349_));
 DFF_X1 \memory_inst.mem[1][7]$_DFFE_PP_  (.D(_085_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[1][7] ),
    .QN(_332_));
 DFF_X1 \memory_inst.mem[2][0]$_DFFE_PP_  (.D(_075_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[2][0] ),
    .QN(_342_));
 DFF_X1 \memory_inst.mem[2][1]$_DFFE_PP_  (.D(_076_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[2][1] ),
    .QN(_341_));
 DFF_X1 \memory_inst.mem[2][2]$_DFFE_PP_  (.D(_019_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[2][2] ),
    .QN(_397_));
 DFF_X1 \memory_inst.mem[2][3]$_DFFE_PP_  (.D(_017_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[2][3] ),
    .QN(_399_));
 DFF_X1 \memory_inst.mem[2][4]$_DFFE_PP_  (.D(_018_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[2][4] ),
    .QN(_400_));
 DFF_X1 \memory_inst.mem[2][5]$_DFFE_PP_  (.D(_020_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[2][5] ),
    .QN(_396_));
 DFF_X1 \memory_inst.mem[2][6]$_DFFE_PP_  (.D(_021_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[2][6] ),
    .QN(_395_));
 DFF_X1 \memory_inst.mem[2][7]$_DFFE_PP_  (.D(_084_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[2][7] ),
    .QN(_333_));
 DFF_X1 \memory_inst.mem[3][0]$_DFFE_PP_  (.D(_022_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[3][0] ),
    .QN(_394_));
 DFF_X1 \memory_inst.mem[3][1]$_DFFE_PP_  (.D(_023_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[3][1] ),
    .QN(_393_));
 DFF_X1 \memory_inst.mem[3][2]$_DFFE_PP_  (.D(_024_),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.mem[3][2] ),
    .QN(_392_));
 DFF_X1 \memory_inst.mem[3][3]$_DFFE_PP_  (.D(_025_),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.mem[3][3] ),
    .QN(_391_));
 DFF_X1 \memory_inst.mem[3][4]$_DFFE_PP_  (.D(_026_),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\memory_inst.mem[3][4] ),
    .QN(_390_));
 DFF_X1 \memory_inst.mem[3][5]$_DFFE_PP_  (.D(_027_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[3][5] ),
    .QN(_389_));
 DFF_X1 \memory_inst.mem[3][6]$_DFFE_PP_  (.D(_028_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[3][6] ),
    .QN(_388_));
 DFF_X1 \memory_inst.mem[3][7]$_DFFE_PP_  (.D(_083_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[3][7] ),
    .QN(_334_));
 DFF_X1 \memory_inst.mem[4][0]$_DFFE_PP_  (.D(_029_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[4][0] ),
    .QN(_387_));
 DFF_X1 \memory_inst.mem[4][1]$_DFFE_PP_  (.D(_030_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[4][1] ),
    .QN(_386_));
 DFF_X1 \memory_inst.mem[4][2]$_DFFE_PP_  (.D(_031_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[4][2] ),
    .QN(_385_));
 DFF_X1 \memory_inst.mem[4][3]$_DFFE_PP_  (.D(_032_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[4][3] ),
    .QN(_384_));
 DFF_X1 \memory_inst.mem[4][4]$_DFFE_PP_  (.D(_033_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[4][4] ),
    .QN(_403_));
 DFF_X1 \memory_inst.mem[4][5]$_DFFE_PP_  (.D(_034_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[4][5] ),
    .QN(_383_));
 DFF_X1 \memory_inst.mem[4][6]$_DFFE_PP_  (.D(_035_),
    .CK(clknet_3_5__leaf_write_clk),
    .Q(\memory_inst.mem[4][6] ),
    .QN(_382_));
 DFF_X1 \memory_inst.mem[4][7]$_DFFE_PP_  (.D(_082_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[4][7] ),
    .QN(_335_));
 DFF_X1 \memory_inst.mem[5][0]$_DFFE_PP_  (.D(_036_),
    .CK(clknet_3_7__leaf_write_clk),
    .Q(\memory_inst.mem[5][0] ),
    .QN(_381_));
 DFF_X1 \memory_inst.mem[5][1]$_DFFE_PP_  (.D(_037_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[5][1] ),
    .QN(_380_));
 DFF_X1 \memory_inst.mem[5][2]$_DFFE_PP_  (.D(_038_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[5][2] ),
    .QN(_379_));
 DFF_X1 \memory_inst.mem[5][3]$_DFFE_PP_  (.D(_039_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[5][3] ),
    .QN(_378_));
 DFF_X1 \memory_inst.mem[5][4]$_DFFE_PP_  (.D(_040_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[5][4] ),
    .QN(_404_));
 DFF_X1 \memory_inst.mem[5][5]$_DFFE_PP_  (.D(_072_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[5][5] ),
    .QN(_345_));
 DFF_X1 \memory_inst.mem[5][6]$_DFFE_PP_  (.D(_074_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[5][6] ),
    .QN(_413_));
 DFF_X1 \memory_inst.mem[5][7]$_DFFE_PP_  (.D(_081_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[5][7] ),
    .QN(_336_));
 DFF_X1 \memory_inst.mem[6][0]$_DFFE_PP_  (.D(_053_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[6][0] ),
    .QN(_364_));
 DFF_X1 \memory_inst.mem[6][1]$_DFFE_PP_  (.D(_054_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[6][1] ),
    .QN(_363_));
 DFF_X1 \memory_inst.mem[6][2]$_DFFE_PP_  (.D(_055_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[6][2] ),
    .QN(_362_));
 DFF_X1 \memory_inst.mem[6][3]$_DFFE_PP_  (.D(_056_),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.mem[6][3] ),
    .QN(_361_));
 DFF_X1 \memory_inst.mem[6][4]$_DFFE_PP_  (.D(_057_),
    .CK(clknet_3_1__leaf_write_clk),
    .Q(\memory_inst.mem[6][4] ),
    .QN(_360_));
 DFF_X1 \memory_inst.mem[6][5]$_DFFE_PP_  (.D(_058_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[6][5] ),
    .QN(_359_));
 DFF_X1 \memory_inst.mem[6][6]$_DFFE_PP_  (.D(_059_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[6][6] ),
    .QN(_358_));
 DFF_X1 \memory_inst.mem[6][7]$_DFFE_PP_  (.D(_080_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[6][7] ),
    .QN(_337_));
 DFF_X1 \memory_inst.mem[7][0]$_DFFE_PP_  (.D(_077_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[7][0] ),
    .QN(_340_));
 DFF_X1 \memory_inst.mem[7][1]$_DFFE_PP_  (.D(_088_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[7][1] ),
    .QN(_418_));
 DFF_X1 \memory_inst.mem[7][2]$_DFFE_PP_  (.D(_070_),
    .CK(clknet_3_0__leaf_write_clk),
    .Q(\memory_inst.mem[7][2] ),
    .QN(_347_));
 DFF_X1 \memory_inst.mem[7][3]$_DFFE_PP_  (.D(_073_),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.mem[7][3] ),
    .QN(_344_));
 DFF_X1 \memory_inst.mem[7][4]$_DFFE_PP_  (.D(_069_),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.mem[7][4] ),
    .QN(_348_));
 DFF_X1 \memory_inst.mem[7][5]$_DFFE_PP_  (.D(_071_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[7][5] ),
    .QN(_346_));
 DFF_X1 \memory_inst.mem[7][6]$_DFFE_PP_  (.D(_087_),
    .CK(clknet_3_4__leaf_write_clk),
    .Q(\memory_inst.mem[7][6] ),
    .QN(_415_));
 DFF_X1 \memory_inst.mem[7][7]$_DFFE_PP_  (.D(_079_),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\memory_inst.mem[7][7] ),
    .QN(_338_));
 DFF_X1 \memory_inst.read_data[0]$_DFFE_PP_  (.D(_066_),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net14),
    .QN(_351_));
 DFF_X1 \memory_inst.read_data[1]$_DFFE_PP_  (.D(_065_),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net15),
    .QN(_352_));
 DFF_X1 \memory_inst.read_data[2]$_DFFE_PP_  (.D(_064_),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(net16),
    .QN(_353_));
 DFF_X1 \memory_inst.read_data[3]$_DFFE_PP_  (.D(_063_),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(net17),
    .QN(_354_));
 DFF_X1 \memory_inst.read_data[4]$_DFFE_PP_  (.D(_062_),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(net18),
    .QN(_355_));
 DFF_X1 \memory_inst.read_data[5]$_DFFE_PP_  (.D(_061_),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net19),
    .QN(_356_));
 DFF_X1 \memory_inst.read_data[6]$_DFFE_PP_  (.D(_060_),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net20),
    .QN(_357_));
 DFF_X1 \memory_inst.read_data[7]$_DFFE_PP_  (.D(_078_),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(net21),
    .QN(_339_));
 BUF_X1 output12 (.A(net12),
    .Z(empty));
 BUF_X1 output13 (.A(net13),
    .Z(full));
 BUF_X1 output14 (.A(net14),
    .Z(read_data[0]));
 BUF_X1 output15 (.A(net15),
    .Z(read_data[1]));
 BUF_X1 output16 (.A(net16),
    .Z(read_data[2]));
 BUF_X1 output17 (.A(net17),
    .Z(read_data[3]));
 BUF_X1 output18 (.A(net18),
    .Z(read_data[4]));
 BUF_X1 output19 (.A(net19),
    .Z(read_data[5]));
 BUF_X1 output20 (.A(net20),
    .Z(read_data[6]));
 BUF_X1 output21 (.A(net21),
    .Z(read_data[7]));
 BUF_X1 place24 (.A(\memory_inst.read_addr[0] ),
    .Z(net24));
 BUF_X1 place25 (.A(net2),
    .Z(net25));
 DFFR_X1 \rd_to_wr_sync.gray_out[0]$_DFF_PN0_  (.D(\rd_to_wr_sync.sync_ff1[0] ),
    .RN(net2),
    .CK(clknet_3_6__leaf_write_clk),
    .Q(\rd_to_wr_sync.gray_out[0] ),
    .QN(_398_));
 DFFR_X1 \rd_to_wr_sync.gray_out[1]$_DFF_PN0_  (.D(\rd_to_wr_sync.sync_ff1[1] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.gray_out[1] ),
    .QN(_410_));
 DFFR_X1 \rd_to_wr_sync.gray_out[2]$_DFF_PN0_  (.D(\rd_to_wr_sync.sync_ff1[2] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.gray_out[2] ),
    .QN(_377_));
 DFFR_X1 \rd_to_wr_sync.gray_out[3]$_DFF_PN0_  (.D(\rd_to_wr_sync.sync_ff1[3] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.gray_out[3] ),
    .QN(_417_));
 DFFR_X1 \rd_to_wr_sync.sync_ff1[0]$_DFF_PN0_  (.D(\rd_gray_current.gray[0] ),
    .RN(net2),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\rd_to_wr_sync.sync_ff1[0] ),
    .QN(_408_));
 DFFR_X1 \rd_to_wr_sync.sync_ff1[1]$_DFF_PN0_  (.D(\rd_gray_current.gray[1] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.sync_ff1[1] ),
    .QN(_409_));
 DFFR_X1 \rd_to_wr_sync.sync_ff1[2]$_DFF_PN0_  (.D(\rd_gray_current.gray[2] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.sync_ff1[2] ),
    .QN(_343_));
 DFFR_X1 \rd_to_wr_sync.sync_ff1[3]$_DFF_PN0_  (.D(\rd_gray_current.binary[3] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\rd_to_wr_sync.sync_ff1[3] ),
    .QN(_330_));
 DFFR_X1 \read_pointer_inst.rd_ptr_bin[0]$_DFF_PN0_  (.D(\rd_gray_next.binary[0] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\memory_inst.read_addr[0] ),
    .QN(_430_));
 DFFR_X1 \read_pointer_inst.rd_ptr_bin[1]$_DFF_PN0_  (.D(\rd_gray_next.binary[1] ),
    .RN(net2),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(\memory_inst.read_addr[1] ),
    .QN(_402_));
 DFFR_X1 \read_pointer_inst.rd_ptr_bin[2]$_DFF_PN0_  (.D(\rd_gray_next.binary[2] ),
    .RN(net2),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(\memory_inst.read_addr[2] ),
    .QN(_401_));
 DFFR_X1 \read_pointer_inst.rd_ptr_bin[3]$_DFF_PN0_  (.D(\rd_gray_next.binary[3] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\rd_gray_current.binary[3] ),
    .QN(_419_));
 DFFR_X1 \wr_to_rd_sync.gray_out[0]$_DFF_PN0_  (.D(\wr_to_rd_sync.sync_ff1[0] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\status_inst.synced_wr_ptr_gray[0] ),
    .QN(_412_));
 DFFR_X1 \wr_to_rd_sync.gray_out[1]$_DFF_PN0_  (.D(\wr_to_rd_sync.sync_ff1[1] ),
    .RN(net2),
    .CK(clknet_1_1__leaf_read_clk),
    .Q(\status_inst.synced_wr_ptr_gray[1] ),
    .QN(_416_));
 DFFR_X1 \wr_to_rd_sync.gray_out[2]$_DFF_PN0_  (.D(\wr_to_rd_sync.sync_ff1[2] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\status_inst.synced_wr_ptr_gray[2] ),
    .QN(_407_));
 DFFR_X1 \wr_to_rd_sync.gray_out[3]$_DFF_PN0_  (.D(\wr_to_rd_sync.sync_ff1[3] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\status_inst.synced_wr_ptr_gray[3] ),
    .QN(_420_));
 DFFR_X1 \wr_to_rd_sync.sync_ff1[0]$_DFF_PN0_  (.D(\wr_gray_current.gray[0] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\wr_to_rd_sync.sync_ff1[0] ),
    .QN(_405_));
 DFFR_X1 \wr_to_rd_sync.sync_ff1[1]$_DFF_PN0_  (.D(\wr_gray_current.gray[1] ),
    .RN(net2),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\wr_to_rd_sync.sync_ff1[1] ),
    .QN(_406_));
 DFFR_X1 \wr_to_rd_sync.sync_ff1[2]$_DFF_PN0_  (.D(\wr_gray_current.gray[2] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\wr_to_rd_sync.sync_ff1[2] ),
    .QN(_350_));
 DFFR_X1 \wr_to_rd_sync.sync_ff1[3]$_DFF_PN0_  (.D(\wr_gray_current.binary[3] ),
    .RN(net25),
    .CK(clknet_1_0__leaf_read_clk),
    .Q(\wr_to_rd_sync.sync_ff1[3] ),
    .QN(_421_));
 DFFR_X1 \write_pointer_inst.wr_ptr_bin[0]$_DFF_PN0_  (.D(\wr_gray_next.binary[0] ),
    .RN(net25),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.write_addr[0] ),
    .QN(_422_));
 DFFR_X1 \write_pointer_inst.wr_ptr_bin[1]$_DFF_PN0_  (.D(\wr_gray_next.binary[1] ),
    .RN(net25),
    .CK(clknet_3_3__leaf_write_clk),
    .Q(\memory_inst.write_addr[1] ),
    .QN(_425_));
 DFFR_X1 \write_pointer_inst.wr_ptr_bin[2]$_DFF_PN0_  (.D(\wr_gray_next.binary[2] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\memory_inst.write_addr[2] ),
    .QN(_426_));
 DFFR_X1 \write_pointer_inst.wr_ptr_bin[3]$_DFF_PN0_  (.D(\status_inst.wr_ptr_gray_next[3] ),
    .RN(net25),
    .CK(clknet_3_2__leaf_write_clk),
    .Q(\wr_gray_current.binary[3] ),
    .QN(_329_));
endmodule
