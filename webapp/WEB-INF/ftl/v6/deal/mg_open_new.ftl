<#include "v6/common/base_v6.ftl" />
<#macro title>
	<@spring.messageText "open.mg.text2" "账目公开"/>
</#macro>
<#macro head>
	<link rel="stylesheet" type="text/css" href="/static/css/openmgNew.css">
</#macro>
<#macro body>
	<#assign nav_page="open">
		<#assign nav_sub_page="open_mg">
			<div class="fixed_topper" id="fixed_topper">
			    <#if SS_USERNAME?exists >
			        <input type="hidden" class="appeal_count" value="${appeal_count}">
			        <input type="hidden" class="forbidden_time" value="${forbidden_time}">
			        <input type="hidden" class="mystatus" value="${user.status}">
			        <#include "v6/common/toper.ftl" >
			    </#if>
			    <div class="header">
			        <div class="warper clearfix">
			            <div class="index_logo"><i class="icon iconfont icon-mindassetlogo"></i>MINDASSET</div>
			            <div class="container">
			                    <#include "v6/common/header.ftl" >
			            </div>
			        </div>
			    </div>
			</div>
			<div class="wrap">
					<div class="open-mg-main">
						<div class="open-mg-main-sub bg-color">
							<div class="open-mg-main-inner">
								<div class="open-mg-main-top">
									<h2 class="open-mg-title"><@spring.messageText "overt.text26" "M.A Blockchain全球MG账目公开"/></h2>
									<p class="open-mg-time"><@spring.messageText "overt.text27" "数据更新时间"/>：<span id="updateTime"></span></p>
								</div>
								<div class="open-mg-main-bot">
									<h5 class="open-mg-main-bot-num"><span class="all-num"></span><span class="account-unit"><@spring.messageText "overt.text126" "亿"/></span></h5>
									<p class="open-mg-main-bot-note"><@spring.messageText "overt.text1" "当前发行资金"/></p>
									<a class="open-mg-main-bot-link"><@spring.messageText "overt.text125" "查看详情"/></a>
								</div>
								<div class="open-mg-main-bot2">
									<ul class="open-mg-nav">
										<li>
											<p><@spring.messageText "overt.text43" "全球交易平台交易总量"/>
												<!--<i class="list-prompt iconfont">
	                         	  	 	 		  &#xe615;
	                         	  	 	 		  <span>全球交易平台交易总量全球交易平台交易总量全球交易平台交易总量全球交易平台交易总量全球交易平台交易总量</span>
	                         	  	 	 		</i>-->
											</p>
											<span>${globalTransactionTotal?number?floor?string(",###")}</span>
											<em></em>
										</li>
										<li>
											<p><@spring.messageText "overt.text46" "最终可流通量占比"/></p>
											<span>${((zzkltl?number)/(dqfxzj?number)*100)?string("0.##")}%</span>
											<em></em>
										</li>
										<li>
											<p><@spring.messageText "overt.text94" "Locktime资金占比"/></p>
											<span>${((locktimezjzl?number) / (dqfxzj?number)*100)?string("0.##")}%</span>
											<em></em>
										</li>
										<li>
											<p><@spring.messageText "overt.text124" "本阶段Locktime剩余量"/></p>
											<span>${(bjdxrlxzl?number - bjdycsdxrlx?number)?string(",###")}</span>
										</li>
									</ul>
									<div class="account-tree">
										<div class="tree-node1">
											<p>
												<@spring.messageText "overt.text1" "当前发行资金"/>
											</p>
											<h5><span class="all-num"></span><span class="account-unit2"><@spring.messageText "overt.text126" "亿"/></span></h5>
										</div>
										<div class="tree-node2-box">
											<div class="tree-node2">
												<em class="tree-line"></em>
												<ul class="tree-child2">
													<li class="tree-node2-1 iconfont">&#xe633;</li>
													<li class="tree-node2-2 iconfont">&#xe634;</li>
												</ul>
											</div>
										</div>
										<div class="tree-node3-box">
											<div class="tree-node3-1">
												<em class="tree-line2"></em>
												<ul class="tree-child3-1">
													<li class="tree-node3-1-1">
														<i class="icon-box iconfont">&#xe609;</i>
														<@spring.messageText "overt.text11" "基金会固定资金"/>
													</li>
													<li class="tree-node3-1-2">
														<i class="icon-box iconfont">&#xe629;</i>
														<@spring.messageText "overt.text10" "Mind Asset 主站"/>
													</li>
													<li class="tree-node3-1-3">
														<i class="icon-box iconfont">&#xe605;</i>
														<@spring.messageText "overt.text9" "POW证明MG总持有量"/>
													</li>
												</ul>
											</div>
											<div class="tree-node3-2">
												<em class="tree-line2"></em>
												<ul class="tree-child3-2">
													<li class="tree-node3-2-1 margin-bot">
														<i class="icon-box iconfont">&#xe60c;</i>
														<@spring.messageText "overt.text12" "已产生的信任利息"/>
													</li>
													<li class="tree-node3-2-2">
														<i class="icon-box iconfont">&#xe60a;</i>
														<@spring.messageText "overt.text13" "已发放世纪投票大奖"/>
													</li>
												</ul>
											</div>
										</div>
										<div class="tree-node4-box">
											<div class="tree-node4-1">
												<em class="tree-line2"></em>
												<ul class="tree-child4-1">
													<li class="tree-node4-1-1">
														<p><@spring.messageText "overt.text16" "开发者团队资金"/></p>
														<span>${kfztdzj?number?floor?string(",###")}</span></li>
													<li class="tree-node4-1-2">
														<p><@spring.messageText "overt.text18" "MG发行中转资金"/></p>
														<span>${mgfxzzzj?number?floor?string(",###")}</span></li>
												</ul>
											</div>
											<div class="tree-node4-1">
												<em class="tree-line2"></em>
												<ul class="tree-child4-1">
													<li class="tree-node4-2-1">
														<p>
															<@spring.messageText "overt.text29" "基金会推广资金"/>
														</p><span>${jjhtgzj?number?floor?string(",###")}</span></li>
													<li class="tree-node4-2-2">
														<p><@spring.messageText "overt.text41" "用户主站未提取资金"/></p>
														<span>${yhzzwtqzj?number?floor?string(",###")}</span></li>
												</ul>
											</div>
											<div class="tree-node4-1">
												<em class="tree-line2"></em>
												<ul class="tree-child4-1">
													<li class="tree-node4-3-1">
														<p>
															<@spring.messageText "overt.text22" "已提取的脑波认证"/>
														</p><span>${ytqdnbrz?number?floor?string(",###")}</span></li>
													<li class="tree-node4-3-2">
														<p>
															<@spring.messageText "overt.text24" "已提取的推广分配奖励"/>
														</p><span>${ytqdtgfpjl?number?floor?string(",###")}</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="mg-open" id="tree-node1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text1" "当前发行资金"/></h3>
								<span>${dqfxzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text2" "当前发行资金即自创世纪起通过POW及POS两种发行机制产生的加密数字货币，包括已发行的MG及已发行但未转化为MG的MN总量。"/>
							</p>
							<div class="modal-subtitle-mg">
								<h5><@spring.messageText "overt.text3" "未染色"/>·${(wrs?number/dqfxzj?number*100)?string("0.##")}%</h5>
								<span>${wrs?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text4" "染色是通过哈希（Hash）运算将MN转化为MG的过程，未染色即已发行但未进行哈希（Hash）染色的MN数量。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<div class="mgopen-property-pow">
									<div class="modal-subtitle-mg">
										<h5><@spring.messageText "overt.text5" "POW发行"/>·${(powfx?number/dqfxzj?number*100)?string("0.##")}%</h5>
										<span>${powfx?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">
										<@spring.messageText "overt.text6" "POW即Proof of work工作证明，总量50亿MG，分为25亿脑波认证及25亿推广分配"/>
									</p>
									<ul class="mgopen-scale mg-open-link" data-index='1'>
										<li>
											<div class="charts-fund" id="canvasBox1"></div>
											<p>
												<@spring.messageText "overt.text11" "基金会固定资金"/>
											</p>
										</li>
										<li>
											<div class="charts-gaia" id="canvasBox2"></div>
											<p>
												<@spring.messageText "overt.text10" "Mindasset主站"/>
											</p>
										</li>
										<li>
											<div class="charts-pow" id="canvasBox3"></div>
											<p>
												<@spring.messageText "overt.text9" "POW证明MG总持有量"/>
											</p>
										</li>
									</ul>
								</div>
								<div class="mgopen-property-pos">
									<div class="modal-subtitle-mg">
										<h5><@spring.messageText "overt.text7" "POS发行"/>·${(posfx?number/dqfxzj?number*100)?string("0.##")}%</h5>
										<span>${posfx?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">
										<@spring.messageText "overt.text8" "POS即Proof of stake权益证明，总量25亿MG，包括系统信任利息及公益投票抽奖"/>
									</p>
									<ul class="mgopen-scale mg-open-link" data-index='2'>
										<li>
											<div class="charts-interest" id="canvasBox4"></div>
											<p>
												<@spring.messageText "overt.text12" "已产生信任利息"/>
											</p>
										</li>
										<li>
											<div class="charts-vote" id="canvasBox5"></div>
											<p>
												<@spring.messageText "overt.text13" "已发放世纪投票大奖"/>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node3-1-1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text11" "基金会固定资金"/></h3>
								<span>${jjhgdzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text14" "基金会固定资金即创世纪区块所产生的约4.99亿中的2亿MG，包括开发者团队资金及MG发行中转资金，不参与自由交易市场的交易。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<ul class="mg-open-link" data-index='1'>
									<li>
										<div class="mgopen-property-develop">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text16" "开发者团队资金"/>·${((kfztdzj?number/jjhgdzj?number)*100)?string("0.##")}%</h5>
												<span>${kfztdzj?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text17" "基金会固定资金的2亿MG，其中1亿作为智慧资产全球发展基金会开发者团队持有部分，并均分为5等份在智慧银行中进行分期圈存，时长从32-1024天不等。"/>
											</p>
										</div>
									</li>
									<li>
										<div class="mgopen-property-trains">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text18" "MG发行中转资金"/>·${((mgfxzzzj?number/jjhgdzj?number)*100)?string("0.##")}%</h5>
												<span>${mgfxzzzj?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text19" "基金会固定资金共2亿MG，其中1亿MG作为智慧资产系统发行中转资金，用于保证用户通过脑波认证及推广分配获得的MG可以即时提取。MG发行中转资金分为2个账户，各5000万MG，当第一个账户中资金使用完毕后，第二个账户中的资金转移到第一个账户中继续使用。"/>
											</p>
										</div>
									</li>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-1-1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3><@spring.messageText "overt.text16" "开发者团队资金"/></h3>
								<span>${kfztdzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text17" "基金会固定资金共2亿MG，其中1亿MG作为智慧资产系统发行中转资金，用于保证用户通过脑波认证及推广分配获得的MG可以即时提取。MG发行中转资金分为2个账户，各5000万MG，当第一个账户中资金使用完毕后，第二个账户中的资金转移到第一个账户中继续使用。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text44" "资产、地址公布"/></h4>
									<b></b>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5>Locktime-64：</h5>
										<span>${kfztdzj64?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzj64}</p>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5>Locktime-128：</h5>
										<span>${kfztdzj128?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzj128}</p>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5>Locktime-256：</h5>
										<span>${kfztdzj256?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzj256}</p>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5>Locktime-512：</h5>
										<span>${kfztdzj512?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzj512}</p>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5>Locktime-1024：</h5>
										<span>${kfztdzj1024?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzj1024}</p>
								</div>
								<div class="mgopen-property-drawed-spread hiddendiv">
									<div class="modal-subtitle-mg">
										<h5><@spring.messageText "overt.text57" "利息存放"/>：</h5>
										<span>${kfztdzjlxcf?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${akfztdzjlxcf}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-1-2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3><@spring.messageText "overt.text18" "MG发行中转资金"/></h3>
								<span>${mgfxzzzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text19" "基金会固定资金共2亿MG，其中1亿MG作为智慧资产系统发行中转资金，用于保证用户通过脑波认证及推广分配获得的MG可以即时提取。MG发行中转资金分为2个账户，各5000万MG，当第一个账户中资金使用完毕后，第二个账户中的资金转移到第一个账户中继续使用。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text44" "资产、地址公布"/></h4>
									<b></b>
								</div>
								<div class="mgopen-property-drawed-brain">
									<div class="modal-subtitle-mg">
										<h5><@spring.messageText "overt.text45" "公开地址"/>1:</h5>
										<span>${mgfxzzzjgkdz1?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${amgfxzzzj1}</p>
								</div>
								<div class="mgopen-property-drawed-spread">
									<div class="modal-subtitle-mg">
										<h5><@spring.messageText "overt.text45" "公开地址"/>2:</h5>
										<span>${mgfxzzzjgkdz2?number?floor?string(",###")}</span>
									</div>
									<p class="mgopen-content-note">${amgfxzzzj2}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node3-2-1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text12" "已产生的信任利息"/></h3>
								<span>${ycsdxrlx?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text20" "在智慧银行系统中设定了Locktime“锁定时间入链”功能，按不同圈存周期存入Locktime的MG可以获得相应的收益即系统信任利息。智慧银行的系统信任利息的发放总额约24亿MG，并随着发行量的减产而循环递减，即奖励总额每发行出10%，不同信任期限所对应的百日利率也会在当前利率的基础上减少10%，且下一个奖励周期的奖励总额为当前所剩奖励总额的10%。"/>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node3-1-3" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text9" "POW证明MG总持有量"/></h3>
								<span>${powzmmgzcyl?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text21" "POW工作证明下的MG总持有量，即用户通过脑波认证及推广分配所获得MG总量。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<ul class="mg-open-link" data-index="3">
									<li>
										<div class="mgopen-property-develop">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text22" "已提取的脑波认证"/>·${(ytqdnbrz?number/powzmmgzcyl?number*100)?string("0.##")}%</h5>
												<span>${ytqdnbrz?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text23" "用户在通过脑波认证获得MG后，已从智慧资产主站提取到智慧银行个人账户中的MG总额。"/>
											</p>
										</div>
									</li>
									<li>
										<div class="mgopen-property-trains">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text24" "已提取的推广分配奖励"/>·${(ytqdtgfpjl?number/powzmmgzcyl?number*100)?string("0.##")}%</h5>
												<span>${ytqdtgfpjl?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text25" "用户在通过智慧矿场及世纪分享获得MG后，已从智慧资产主站提取转移的MG总额。"/>
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node3-1-2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text10" "Mind Asset主站"/></h3>
								<span>${mindassetzz?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text28" "现阶段主站中MN及MG的资产总额，包含基金会推广资金及用户未从主站提取的资金。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<ul class="mg-open-link" data-index='2'>
									<li>
										<div class="mgopen-property-develop">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text29" "基金会推广资金"/>·${((jjhtgzj?number/mindassetzz?number)*100)?string("0.##")}%</h5>
												<span>${jjhtgzj?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text30" "基金会推广资金包括用户转移MP的手续费、用户违规认证所扣除的MG，以及推广分配中矿工贡献结余的MG等，本部分资金将用于智慧资产推广，如冥想认证体验券等，不参与自由交易市场的交易。"/>
											</p>
										</div>
									</li>
									<li>
										<div class="mgopen-property-trains">
											<div class="modal-subtitle-mg">
												<h5><@spring.messageText "overt.text41" "用户主站未提取资金"/>·${((yhzzwtqzj?number/mindassetzz?number)*100)?string("0.##")}%</h5>
												<span>${yhzzwtqzj?number?floor?string(",###")}</span>
											</div>
											<p class="mgopen-content-note">
												<@spring.messageText "overt.text42" "用户已经持有但未认证的MN，以及未发放、未领取的推广分配奖励和用户未提取的MG的总额。"/>
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-2-1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3><@spring.messageText "overt.text29" "基金会推广资金"/></h3>
								<span>${jjhtgzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text30" "基金会推广资金包括用户转移MP的手续费、用户违规认证所扣除的MG，以及推广分配中矿工贡献结余的MG等，本部分资金将用于智慧资产推广，如冥想认证体验券等，不参与自由交易市场的交易。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text47" "转包手续费"/></h5>
									<span>${zbsxf?number?floor?string(",###")}</span>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text48" "作弊惩罚"/></h5>
									<span>${zbcf?number?floor?string(",###")}</span>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text49" "矿工贡献结余"/></h5>
									<span>${kggxjy?number?floor?string(",###")}</span>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list2">
									<h5><@spring.messageText "overt.text50" "支出的体验券"/></h5>
									<span>${zcdtyq?number?floor?string(",###")}</span>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list2">
									<h5><@spring.messageText "overt.text51" "收入的矿工贡献结余"/></h5>
									<span>${sykggxjy?number?floor?string(",###")}</span>
								</div>
							</div>
							<div class="mgopen-property hiddendiv">
								<div class="mgopen-property-title mgopen-margin">
									<h4><@spring.messageText "overt.text52" "地址公布"/></h4>
									<b></b>
								</div>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text53" "转包手续费地址"/>：</h5>
								</div>
								<p class="mgopen-content-note mgopen-margin-sm">${ajjhtgzjzbsxf}</p>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text54" "作弊惩罚地址"/>：</h5>
								</div>
								<p class="mgopen-content-note mgopen-margin-sm">${ajjhtgzjzbcf}</p>
								<div class="modal-subtitle-mg modal-promotion-list">
									<h5><@spring.messageText "overt.text55" "收入的矿工贡献结余地址"/>：</h5>
								</div>
								<p class="mgopen-content-note">${ajjhtgzjsykggxjy}</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-2-2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3 title="<@spring.messageText "overt.text41" "用户主站未提取资金"/>"><@spring.messageText "overt.text41" "用户主站未提取资金"/></h3>
								<span>${yhzzwtqzj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text42" "用户已经持有但未认证的MN，以及未发放、未领取的推广分配奖励和用户未提取的MG的总额。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text15" "资产构成"/></h4>
									<b></b>
								</div>
								<ul class="modal-Undraw-list">
									<li>
										<h5 class="left"><@spring.messageText "overt.text59" "主站推广分配余额"/></h5>
										<span class="right">${zztgfpye?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text60" "未发放的推广奖励"/></h5>
										<span class="right">${wffdtgjl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text71" "未提取的推广奖励"/></h5>
										<span class="right">${wtqdtgjl?number?floor?string(",###")}</span>
									</li>
								</ul>
								<ul class="modal-Undraw-list">
									<li>
										<h5 class="left"><@spring.messageText "overt.text72" "主站MN余额"/></h5>
										<span class="right">${zzmnye?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text73" "未解包的MP"/></h5>
										<span class="right">${wjbdmp?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text74" "未认证的MN"/></h5>
										<span class="right">${wrzdmn?number?floor?string(",###")}</span>
									</li>
								</ul>
								<ul class="modal-Undraw-list">
									<li>
										<h5 class="left"><@spring.messageText "overt.text75" "主站MG余额"/></h5>
										<span class="right">${zzmgye?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text76" "主站MG余额计算明细"/>：</h5>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text77" "脑波认证总数"/></h5>
										<span class="right">${nbrzzs?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text78" "充值到主站的MG"/></h5>
										<span class="right">${czdzzmg?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text130" "提取到主站的推广分配数量"/></h5>
										<span class="right">${tqdzzdtgfpsl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text131" "MPS分配量"/></h5>
										<span class="right">${mpsfpl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text119" "MPS消耗的MG数"/></h5>
										<span class="right">${mpsxhdmgs?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text80" "已提取的脑波认证"/></h5>
										<span class="right">${ytqdnbrz?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text91" "基金会收购量"/></h5>
										<span class="right">${jjhsgl?number?floor?string(",###")}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-3-1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3><@spring.messageText "overt.text80" "已提取的脑波认证"/></h3>
								<span>${ytqdnbrz?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text23" "用户在通过脑波认证获得MG后，已从智慧资产主站提取到智慧银行个人账户中的MG总额。"/>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node4-3-2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<!--<em class="brn-back iconfont">&#xe61b;</em>-->
								<h3 title="<@spring.messageText "overt.text24" "已提取的推广分配奖励"/>"><@spring.messageText "overt.text24" "已提取的推广分配奖励"/></h3>
								<span>${ytqdtgfpjl?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text25" "用户在通过智慧矿场及世纪分享获得MG后，已从智慧资产主站提取转移的MG总额。"/>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="tree-node3-2-2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text13" "已发放世纪投票大奖"/></h3>
								<span>${yffsjtpdj?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text92" "在智慧银行中设定了公益投票机制，系统使用者通过个人银行地址下MG的“币龄”来获得选票，并将选票投给公益组织。在当前世纪结束后，系统将当前投票奖励剩余的10%平均分配给随机抽取的100个投票地址。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text93" "发放情况"/></h4>
									<b></b>
								</div>
								<ul class="modal-Undraw-list">
									<li>
										<h5 class="left"><@spring.messageText "overt.text95" "本世纪进度"/>（<@spring.messageText "overt.text127" "第"/>${centuryCount}<@spring.messageText "overt.text128" "世纪"/>）</h5>
										<span class="right">${currentProgress?number?floor?string("0")}/100</span>
									</li>
									<li>
										<div class="vote-progress-box">
											<em class="vote-progress"></em>
										</div>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text96" "本世纪发放"/></h5>
										<span class="right">${bsjfftpjl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5 class="left"><@spring.messageText "overt.text97" "上世纪发放"/></h5>
										<span class="right">${sssyfftpjl?number?floor?string(",###")}</span>
									</li>
								</ul>
							</div>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text98" "如何参与投票"/></h4>
									<b></b>
								</div>
								<p class="mgopen-content-note margin-vote">
									<@spring.messageText "overt.text99" "智慧银行中设定了去中心化全球公益投票机制，系统使用者进入智慧银行的“公益投票”页面，即可将所拥有的有效选票投给支持的公益组织。每个MG的“币龄”达到32天（以区块天为准）即可获得一张有效选票，“币龄”到达32天的MG在投出选票后可重新累计“币龄”。"/>
								</p>
								<div class="modal-subtitle-mg modal-promotion-list ">
									<h5><@spring.messageText "overt.text100" "什么是“币龄”？"/></h5>
								</div>
								<p class="mgopen-content-note">
									<@spring.messageText "overt.text101" "“币龄”即用户接收的或提取到智慧银行账户中的MG，在个人账户中不进行转移的时长。32天（区块天）为一个“币龄”周期，即产生一张有效选票。"/>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
            <!--顶部四块的弹窗-->
			<div class="mg-open" id="open-mg-nav1" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3 title="<@spring.messageText "overt.text43" "全球交易平台交易总量"/>"><@spring.messageText "overt.text43" "全球交易平台交易总量"/></h3>
								<span>${globalTransactionTotal?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text129" "本阶段信任利息剩余量=本阶段信任利息总量-本阶段已产生的信任利息"/>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="open-mg-nav2" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text103" "最终可流通占比"/></h3>
								<span>${(zzkltl?number/dqfxzj?number*100)?number?floor?string("0.##")}%</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text104" "最终可流通占比=最终可流通量／当前总发行量"/>
							</p>
							<div class="modal-subtitle-mg">
								<h5><@spring.messageText "overt.text105" "最终可流通量"/></h5>
								<span>${zzkltl?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text106" "在所有用户已持有的MG总量中，未圈存Locktime（包括尚未抢存及已到期）的MG总量，即为可参与自由市场交易的最终可流通量。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text107" "计算明细"/></h4>
									<b></b>
								</div>
								<ul class="content-info-list">
									<li>
										<h5><@spring.messageText "overt.text108" "已提取的脑波认证"/></h5>
										<span>${ytqdnbrz?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text109" "已提取的推广分配奖励"/></h5>
										<span>${ytqdtgfpjl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text110" "用户已产生的locktime利息"/></h5>
										<span>${yhycsdlocktimelx?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text13" "已发放世纪投票大奖"/></h5>
										<span>${yffsjtpdj?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text117" "用户参与Locktime总量"/></h5>
										<span>${yhcylocktimezl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text112" "充值到主站的MG"/></h5>
										<span>${czdzzmg?number?floor?string(",###")}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="open-mg-nav3" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text113" "Locktime资金占比"/></h3>
								<span>${(locktimezjzl?number/dqfxzj?number*100)?string("0.##")}%</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text114" "Locktime资金占比=Locktime资金总量／当前总发行量"/>
							</p>
							<div class="modal-subtitle-mg">
								<h5><@spring.messageText "overt.text115" "Locktime资金总量"/></h5>
								<span>${locktimezjzl?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text116" "Locktime即“鎖定時間入鏈”是POS權益證明機制下的新幣發行方式之一。用戶選擇不同的圈存期限將MG存入Locktime，即可獲得相應百日利率下的系統信任利息，Locktime的圈存期限從16-1024天不等，選擇的期限越長，所對應的百日利率就越高。"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text107" "计算明细"/></h4>
									<b></b>
								</div>
								<ul class="content-info-list">
									<li>
										<h5><@spring.messageText "overt.text117" "用户参与Locktime总量"/></h5>
										<span>${yhcylocktimezl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text118" "Locktime开发者团队资金"/></h5>
										<span>${locktimekfztdzj?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text119" "MPS消耗的MG数"/></h5>
										<span>${mpsxhdmgs?number?floor?string(",###")}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="mg-open" id="open-mg-nav4" role="dialog">
				<div class="modal-dialog-openmg" role="document">
					<div class="modal-content-mg">
						<em class="close-btn iconfont" data-dismiss="modal" aria-label="Close">&#xe71d;</em>
						<div class="modal-body-mg">
							<div class="modal-title-mg">
								<h3><@spring.messageText "overt.text120" "本阶段信任利息剩余量"/></h3>
								<span>${(bjdxrlxzl?number - bjdycsdxrlx?number)?number?floor?string(",###")}</span>
							</div>
							<p class="mgopen-content-note">
								<@spring.messageText "overt.text121" "本阶段信任利息剩余量=本阶段信任利息总量-本阶段已产生的信任利息"/>
							</p>
							<div class="mgopen-property">
								<div class="mgopen-property-title">
									<h4><@spring.messageText "overt.text107" "计算明细"/></h4>
									<b></b>
								</div>
								<ul class="content-info-list">
									<li>
										<h5><@spring.messageText "overt.text122" "本阶段信任利息总量"/></h5>
										<span>${bjdxrlxzl?number?floor?string(",###")}</span>
									</li>
									<li>
										<h5><@spring.messageText "overt.text123" "本阶段已产生的信任利息"/></h5>
										<span>${bjdycsdxrlx?number?floor?string(",###")}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<#include "v6/common/footer.ftl">
			</div>
</#macro>
<#macro footerjs>
	<script src="/static/v6/js/lib/require.js"></script>
	<script type="text/javascript">
		require.config({
			baseUrl: '/',
			paths: {
				jquery: '/static/v6/js/lib/jquery-1.11.2.min',
				d3: '/static/v6/js/lib/d3.min',
				jsencrypt: '/static/v6/js/module/jsencrypt',
				artTemplate: '/static/v6/js/module/template.min'
			}
		});
        var hoopRate = [${(jjhgdzj?number/powfx?number*100)?string("0")},${(mindassetzz?number/powfx?number*100)?string("0")},${(powzmmgzcyl?number/powfx?number*100)?string("0")},${(ycsdxrlx?number/posfx?number*100)?string("0")},${(yffsjtpdj?number/posfx?number*100)?string("0")}];
		var centuryTime = ${currentProgress?number/100};
		var updateTime = ${updateTime};
		var allNum = ${dqfxzj}
		require(['static/v6/js/page/BasicFramework','static/v6/js/page/mg_open']);
	</script>
</#macro>