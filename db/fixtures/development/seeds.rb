Line.seed(
  { id:1,name: '山手',image:'JR.png'},
  { id:2,name: '埼京',image:'JR.png'},
  { id:3,name: '半蔵門',image:'Tokyo_metoro.png'},
  { id:3,name: '半蔵門',image:'Tokyo_metoro.png'}
)
Station.seed(
# 山手線
  { id:1,name: '東京'},{ id:2,name: '神田'},{ id:3,name: '秋葉原'},{ id:4,name: '御徒町'},{ id:5,name: '上野'},
  { id:6,name: '鶯谷'},{ id:7,name: '日暮里'},{ id:8,name: '西日暮里'},{ id:9,name: '田端'},{ id:10,name: '駒込'},
  { id:11,name: '巣鴨'},{ id:12,name: '大塚'},{ id:13,name: '池袋'},{ id:14,name: '目白'},{ id:15,name: '高田馬場'},
  { id:16,name: '新大久保'},{ id:17,name: '新宿'},{ id:18,name: '代々木'},{ id:19,name: '原宿'},{ id:20,name: '渋谷'},
  { id:21,name: '恵比寿'},{ id:22,name: '目黒'},{ id:23,name: '五反田'},{ id:24,name: '大崎'},{ id:25,name: '品川'},
  { id:26,name: '田町'},{ id:27,name: '浜松町'},{ id:28,name: '新橋'},{ id:29,name: '有楽町'},
# 埼京線
  # 大崎,恵比寿,渋谷,新宿,池袋,板橋,十条,赤羽,浮間舟渡,戸田公園,戸田,北戸田,武蔵浦和,中浦和,南与野,与野本町,北与野,大宮
  { id:30,name: '板橋'},{ id:31,name: '十条'},{ id:32,name: '赤羽'},{ id:33,name: '浮間舟渡'},{ id:34,name: '戸田公園'},
  { id:35,name: '戸田'},{ id:36,name: '北戸田'},{ id:37,name: '武蔵浦和'},{ id:38,name: '中浦和'},{ id:39,name: '南与野'},
  { id:40,name: '与野本町'},{ id:41,name: '北与野'},{ id:42,name: '大宮'},
# 半蔵門線
  # 押上[スカイツリー前],錦糸町,住吉,清澄白河,水天宮前,大手町,神保町,九段下,半蔵門,永田町,青山一丁目,表参道,渋谷
  { id:43,name: '押上'},{ id:44,name: '錦糸町'},{ id:45,name: '住吉'},{ id:46,name: '清澄白河'},{ id:47,name: '水天宮前'},
  { id:48,name: '三越前'},{ id:49,name: '大手町'},{ id:50,name: '神保町'},{ id:51,name: '九段下'},{ id:52,name: '半蔵門'},
  { id:53,name: '永田町'},{ id:54,name: '青山一丁目'},{ id:55,name: '表参道'},
)


LineStation.seed(
# 山手線
  {id:1,line_id:1,station_id:1},{id:2,line_id:1,station_id:2},{id:3,line_id:1,station_id:3},{id:4,line_id:1,station_id:4},
  {id:5,line_id:1,station_id:5},{id:6,line_id:1,station_id:6},{id:7,line_id:1,station_id:7},{id:8,line_id:1,station_id:8},
  {id:9,line_id:1,station_id:9},{id:10,line_id:1,station_id:10},{id:11,line_id:1,station_id:11},{id:12,line_id:1,station_id:12},
  {id:13,line_id:1,station_id:13},{id:14,line_id:1,station_id:14},{id:15,line_id:1,station_id:15},{id:16,line_id:1,station_id:16},
  {id:17,line_id:1,station_id:17},{id:18,line_id:1,station_id:18},{id:19,line_id:1,station_id:19},{id:20,line_id:1,station_id:20},
  {id:21,line_id:1,station_id:21},{id:22,line_id:1,station_id:22},{id:23,line_id:1,station_id:23},{id:24,line_id:1,station_id:24},
  {id:25,line_id:1,station_id:25},{id:26,line_id:1,station_id:26},{id:27,line_id:1,station_id:27},{id:28,line_id:1,station_id:28},
  {id:29,line_id:1,station_id:29},
# 埼京線
  # 大崎,恵比寿,渋谷,新宿,池袋,板橋,十条,赤羽,浮間舟渡,戸田公園,戸田,北戸田,武蔵浦和,中浦和,南与野,与野本町,北与野,大宮
  {id:30,line_id:2,station_id:24},{id:31,line_id:2,station_id:21},{id:32,line_id:2,station_id:20},{id:33,line_id:2,station_id:17},
  {id:34,line_id:2,station_id:13},{id:35,line_id:2,station_id:30},{id:36,line_id:2,station_id:31},{id:37,line_id:2,station_id:32},
  {id:38,line_id:2,station_id:33},{id:39,line_id:2,station_id:34},{id:40,line_id:2,station_id:35},
  {id:40,line_id:2,station_id:36},{id:41,line_id:2,station_id:37},{id:42,line_id:2,station_id:38},{id:43,line_id:2,station_id:39},
  {id:44,line_id:2,station_id:40},{id:45,line_id:2,station_id:41},{id:46,line_id:2,station_id:42},
# 半蔵門線
  {id:47,line_id:3,station_id:43},{id:48,line_id:3,station_id:44},{id:49,line_id:3,station_id:45},
  {id:50,line_id:3,station_id:46},{id:51,line_id:3,station_id:47},{id:52,line_id:3,station_id:48},{id:53,line_id:3,station_id:49},
  {id:54,line_id:3,station_id:50},{id:55,line_id:3,station_id:51},{id:56,line_id:3,station_id:52},{id:57,line_id:3,station_id:53},
  {id:58,line_id:3,station_id:54},{id:59,line_id:3,station_id:55},{id:60,line_id:3,station_id:20},

#   {id:0,line_id:2,station_id:24},{id:1,line_id:2,station_id:21},{id:2,line_id:2,station_id:},{id:3,line_id:2,station_id:24},
#   {id:4,line_id:2,station_id:25},{id:5,line_id:2,station_id:26},{id:6,line_id:2,station_id:27},{id:7,line_id:2,station_id:28},
#   {id:8,line_id:2,station_id:24},{id:9,line_id:2,station_id:21},
)