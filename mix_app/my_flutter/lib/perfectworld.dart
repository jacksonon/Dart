import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 风景区
    Widget addressArea = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 上面文本
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '公司地址：',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '北京市朝阳区大屯路完美国际大厦',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('888'),
        ],
      ),
    );

    // 构建单个按钮布局
    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center, // 垂直方向上居中对齐
        mainAxisSize: MainAxisSize.min, // 垂直方向大小最小化
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen[600],),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600],
              ),
            ),
          )
        ],
      );
    }

    Widget buttonsArea = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平均分
        children: <Widget>[
          buildButtonColumn(Icons.call, '电话'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );

    Widget infoArea = Container(
      padding: const EdgeInsets.all(15.0),
      child: Text(
          '''
        完美世界控股集团是国际化的文娱产业集团，拥有A股上市公司完美世界股份有限公司（002624）。旗下产品遍布美、欧、亚等全球100多个国家和地区；在北京、香港、上海、重庆、成都、海南等地皆设有分支机构，在美国、荷兰、法国、韩国、日本等地区设有20多个海外分支机构。目前，集团涵盖影视、游戏、电竞、院线、动画、教育等业务板块，同时战略布局文学、传媒等领域。
　　完美世界自2011年至2019年，8次被认定为中国文化企业30强，并获评2011-2012年度、2013-2014年度、2015-2016年度、2017-2018年度国家文化出口重点企业；2016年荣获最具社会责任上市公司奖；2017年荣获2016-2017年度中国最受尊敬企业；2018 年获得“中国游戏社会责任企业典范奖”。
        影视：完美世界影视业务涵盖精品内容、艺人经纪、综艺娱乐、影游联动、国际业务和投资等领域。公司热播电视剧播出占中国黄金时段逾10%；影视剧作品荣获包括电视剧飞天奖、白玉兰奖、华鼎奖、中美电影节“优秀中国电视剧”金天使奖，电影华表奖、大众电影百花奖、金马奖、奥斯卡金像奖等知名奖项。2014年7月，习近平主席在出访阿根廷期间，将完美世界影视出品的《北京青年》《老有所依》和《失恋33天》等影视作品作为国礼赠送给阿根廷总统。
　　此外，完美世界影视2016年还与好莱坞著名公司环球影业达成了战略合作，参与投资的《至暗时刻》荣获第90届美国奥斯卡金像奖最佳男主角、最佳化妆及发型设计，《魅影缝匠》荣获最佳服装设计；《黑色党徒》《登月第一人》分别斩获第91届奥斯卡“最佳改编剧本”和“最佳视觉效果”两项大奖。

　　游戏：作为中国最早进行海外运营的网络游戏公司，完美世界游戏在中国网络游戏海外出口市场收入中多年稳居前列。截至目前，完美世界游戏在北美洲、欧洲和亚洲设有全资子公司，并已成功将旗下游戏授权至亚洲、拉丁美洲、俄罗斯联邦等多个国家和地区进行运营，为中华文化在全球传播起到了积极的作用。

　　电竞：完美世界作为DOTA2、CS:GO等知名电竞产品的官方运营商，不断为全球玩家带来精彩的娱乐体验。2015年起，完美世界成功主办了CS:GO亚洲邀请赛、三届DOTA2亚洲邀请赛以及DOTA2超级锦标赛等国际大型电竞比赛，并协助美国VALVE公司举办世界最高级别的电竞比赛——2019DOTA2国际邀请赛，通过大型赛事的国际影响力，提高中国电竞在世界的地位。未来，完美世界将探索综合性电竞嘉年华等多种商业形式，与法国等著名机构建立合作，并通过电竞赛事与文化论坛等活动庆祝中法建交55周年，积极推动全球青年交流，使电竞不再限于单纯的娱乐竞技项目，而是成为促进文化互通的桥梁。
　　2018年6月，完美世界与美国Valve公司开启“蒸汽平台”项目合作。完美世界负责将海外优秀游戏产品引进中国，同时推荐及支持中国游戏产品走出国门。完美世界将通过蒸汽平台推出更多游戏产品，为中国玩家及开发商提供高品质的内容以及更优越的体验与服务，助力中国游戏企业，尤其是中小游戏公司更好地“走向”海外。

　　院线：2016年10月，完美世界院线公司和影院管理公司成立，主要从事院线及影院经营，具体包括院线的发行、影院的开发、投资、建设、影院放映以及商品销售、广告发布等衍生业务。截至目前，完美世界控股的90家影院分布东北、华东、华南、西南地区20个省份及直辖市，覆盖全国60余个城市及自治州。完美世界院线管理的影院近200家。

　　动画：完美鲲鹏（北京）动漫科技有限公司成立于2015年，拥有自主研发三维动画制作引擎，并搭建了国际动画创意制作团队，致力为中国和全球用户打造优质的原创动画内容，提供高品质的衍生授权产品，并进一步推动中国动画的发展。其历时3年打造的首部作品《宇宙护卫队》自2018年10月上线以来，就在多个平台多个时段获得收视冠军，视频平台全网播放量逾16亿，并获得广电总局年度优秀国产电视动画片称号。

　　教育：主要包括洪恩(幼儿)、洪恩APP (幼儿)、完美世界教育(终身教育)、通识教育(全景丛书系列)以及全历史APP(历史知识社区)五个模块。
　　洪恩教育成立于1996年，是中国儿童教育电子产品、金牌数字内容和儿童素质教育课程的专业研发公司。教育电子产品包括洪恩点读笔、早教故事机、儿童学习机等；金牌数字内容涵盖阅读与识字、数学与思维、英语、有声绘本馆、有声国学馆等；儿童素质教育机构分为洪恩幼儿园·婴幼园和洪恩教育小镇，专业提供0-3、3-6岁儿童素质教育优质课程。洪恩的产品已经走进了上千万个家庭；洪恩的教材和课程，每年服务全国20000余所幼儿园、3000余家培训学校及全国500多万儿童；洪恩产品更出口至欧洲和美国等地。
　　洪恩完美未来教育科技有限公司致力于探索教育创新技术，持续推出高品质的原创内容和产品，为全球儿童提供真正寓教于乐的全面解决方案。公司已陆续推出“洪恩识字”、“洪恩数学”、“洪恩故事”、“洪恩双语绘本”等多个不同学科的儿童教育App，先后数十次获得苹果App Store和各大安卓应用商店的精品推荐与年度大奖，收获千万家长和孩子的一致好评，并成为儿童教育行业内备受瞩目的新生代领军品牌。
　　完美世界教育自2015年成立以来，围绕“产教融合、校企共建”，整合教育资源，创新服务模式，为高校、企业和政府提供包括教学、实验、竞赛及科研服务，内容涵盖科研孵化、产业学院、实习实训平台、创新创业、专业共建、学术研讨等多种形式。旗下品牌“像素种子数字与艺术教育基地”专注培养文创技术及人才，构建高校、企业、学生及数字文创产业教育服务生态圈。2016年底，完美世界教育与英国阿伯泰大学合作，目前已联合推出游戏开发专业硕士（MPPOP）和在职游戏开发专业硕士（Work-based MProf）两个项目。2019年，由ISC法国巴黎高等商业学院作为教学主体、完美世界教育提供产业指导、复策国际商学院负责教务管理的“ISC文创 EMBA”正式启动，“ISC文创 EMBA”将致力于为领袖型人才打造最好文创思维平台，使之成为各行各业变革的驱动力。在电竞教育方面，完美世界教育与国内外多所高等院校和中职院校进行产教融合合作，为教育端提供源自产业的教学解决方案，推动建设中国电竞教育体系。此外，集团设立全球青年领袖实验室，旨在为“有志、愿为”的优秀青年提供海外深造、全球实践、公益活动、国际交流的平台。
　　池宇峰博士于2016年创立完美世界通识教育科技有限公司，原创并策划出版“全景系列丛书”。丛书面向未来解读前人智慧与经典，洞察人的成长规律和社会发展趋势，秉承授人以渔、服务社会的理念，助力于青年人认识自我、认识社会的探索和成长。该系列第一本《人的全景》将于2019年9月面世。
　　《全历史》基于AI知识图谱，展现不同角度的历史世界，是一个面向全年龄层的知识内容平台，旨在为用户打造俯瞰世界、纵览人类文明的多元化历史知识社区。平台拥有数十万册中外古籍和高清名画的线上资源，包罗科技史、国别史、艺术史等数十个专业历史发展脉络。其中，国别史纵横中外、斟酌古今、钩沉历史，通过历史地图、关系图谱等工具，集趣味性、知识性、科学性、可视性于一体，可辅助专业研究。

　　此外，完美世界控股集团战略布局文学、传媒等领域。在文学领域，纵横文学旗下拥有纵横中文网、熊猫看书、百度书城等，日用户量总计突破1400万，签约作品数量突破30万，是国内顶尖的原创小说创作平台和数字内容阅读平台。在传媒领域，星游集团是国内最大的游戏媒体及玩家社区集团之一，目前已涵盖MMO精品、电竞、主机、手游、DOSPY等媒体渠道，平台每日访问量达2亿8千万，注册用户超过2亿。
        '''
      ),
    );

    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          '北京完美世界控股集团',
//          style: TextStyle(
//            color: Colors.white,
//          ),
//        ),
//      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            'https://img.zcool.cn/community/0185645853f363a8012060c80c04e3.jpg@1280w_1l_2o_100sh.jpg',
            fit: BoxFit.fitWidth,
          ),
          addressArea,
          buttonsArea,
          infoArea,
        ],
      ),
    );

//    return new MaterialApp(
//      title: '完美世界介绍',
//      theme: new ThemeData(
//        brightness: Brightness.light, // 整体色调
//        primaryColor: Colors.lightGreen[600], // 主要部分背景色
//        accentColor: Colors.orange[600],// 前景色
//      ),
//      home:
//    );
  }
}