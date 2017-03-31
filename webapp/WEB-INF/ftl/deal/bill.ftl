<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "asset.text1" "资产管理"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/bill.css" />
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    		<h2><@spring.messageText "asset.text1" "资产管理"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap">
	    				<div class="bill-title">
	    					<h5>账单明细</h5>
	    				</div>
	    				<div class="bill-content">
	    					<div class="bill-condition">
	    						过滤器：
	    						<select>
	    							<option value="0">充值</option>
	    							<option value="0">买入MG</option>
	    							<option value="0">卖出MG</option>
	    							<option value="0">奖励</option>
	    						</select>
	    						<span class="btn-last2day">最近两天</span>
	    						<span class="btn-before2day selected-date">两天以前</span>
	    						<input class="begin-date" type="text" />
	    						-
	    						<input class="end-date" type="text" />
	    						<input type="submit" value="查询" />
	    					</div>
	    					<div class='bill-data'>
	    						<table>
	    							<thead>
	    								<tr>
	    									<th>成交时间</th>
	    									<th>类型</th>
	    									<th>金额</th>
	    									<th>余额</th>
	    									<th>MG数量</th>
	    									<th>MG余额</th>
	    									<th>MP数量</th>
	    									<th>地址</th>
	    								</tr>
	    							</thead>
	    							<tbody>
	    								<tr>
	    									<td>2016-04-02 4:23:23</td>
	    									<td>卖出</td>
	    									<td>123</td>
	    									<td>333</td>
	    									<td>+33</td>
	    									<td>11</td>
	    									<td>11</td>
	    									<td>dsadasddsad</td>
	    								</tr>
	    								<tr>
	    									<td>2016-04-02 4:23:23</td>
	    									<td>卖出</td>
	    									<td>123</td>
	    									<td>333</td>
	    									<td>+33</td>
	    									<td>11</td>
	    									<td>11</td>
	    									<td>dsadasddsad</td>
	    								</tr>
	    								<tr>
	    									<td>2016-04-02 4:23:23</td>
	    									<td>卖出</td>
	    									<td>123</td>
	    									<td>333</td>
	    									<td>+33</td>
	    									<td>11</td>
	    									<td>11</td>
	    									<td>dsadasddsad</td>
	    								</tr>
	    								<tr>
	    									<td>2016-04-02 4:23:23</td>
	    									<td>卖出</td>
	    									<td>123</td>
	    									<td>333</td>
	    									<td>+33</td>
	    									<td>11</td>
	    									<td>11</td>
	    									<td>dsadasddsad</td>
	    								</tr>
	    							</tbody>
	    						</table>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-s">
	    			<#include "common/assets_side_nav.ftl" >
	    		</div>
	    	</div>
	    </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</#macro>

<#macro footerjs>
</#macro>
