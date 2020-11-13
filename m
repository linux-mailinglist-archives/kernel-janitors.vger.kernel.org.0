Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BFA2B178F
	for <lists+kernel-janitors@lfdr.de>; Fri, 13 Nov 2020 09:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKMIxF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 13 Nov 2020 03:53:05 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35258 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgKMIxF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Nov 2020 03:53:05 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AD8ji0G017504;
        Fri, 13 Nov 2020 08:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=dSCB3F9tXjR+0oVnueJkEEL6OzCz1yRorYE096X609o=;
 b=PY0THt58/Xsq1ym5xGBJYGBm7FE/RdGzGnu+94Rt/OTom5KnH27+5Wf/7cYmWR19FN7n
 vBmnOpPuNFFohEOmArDJ21Gqotqb4KJs0WagOz7l1vxDIkwXNzkFVrT5kQygCcOKSfAl
 SVSvExfra6g/1vAq5JEK84HFbi+TsDoaoMSSaAJYkymCSGWLwJj8ffCI1Rv3sQc6iVdN
 XRZCwgkEXnn86OuiS7MWnqBk0bT4oxxX8sHN1DLZwVW3PA9SQUstVCZInTdcvHCxq0jE
 DDeoYQNv5nzZPK/x6gpih3nbf3YIRtSMEKnRqd4HaMVzklXb5KNasAolv+4rFi0Lww3e QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 34p72eyjrh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Nov 2020 08:53:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AD8jEsg139438;
        Fri, 13 Nov 2020 08:53:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 34rt57gpqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Nov 2020 08:53:02 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AD8r1uO026942;
        Fri, 13 Nov 2020 08:53:01 GMT
Received: from mwanda (/10.175.206.108)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 13 Nov 2020 00:53:00 -0800
Date:   Fri, 13 Nov 2020 11:52:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     paul@paul-moore.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] netlabel: fix our progress tracking in
 netlbl_unlabel_staticlist()
Message-ID: <20201113085255.GA91999@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=3 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=3 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130053
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Paul Moore,

The patch 866358ec331f: "netlabel: fix our progress tracking in
netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
static checker warning:

	net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
	error: uninitialized symbol 'iter_chain'.

net/netlabel/netlabel_unlabeled.c
  1163  static int netlbl_unlabel_staticlist(struct sk_buff *skb,
  1164                                       struct netlink_callback *cb)
  1165  {
  1166          struct netlbl_unlhsh_walk_arg cb_arg;
  1167          u32 skip_bkt = cb->args[0];
  1168          u32 skip_chain = cb->args[1];
  1169          u32 skip_addr4 = cb->args[2];
  1170          u32 iter_bkt, iter_chain, iter_addr4 = 0, iter_addr6 = 0;
                              ^^^^^^^^^^
This used to be initialized here.

  1171          struct netlbl_unlhsh_iface *iface;
  1172          struct list_head *iter_list;
  1173          struct netlbl_af4list *addr4;
  1174  #if IS_ENABLED(CONFIG_IPV6)
  1175          u32 skip_addr6 = cb->args[3];
  1176          struct netlbl_af6list *addr6;
  1177  #endif
  1178  
  1179          cb_arg.nl_cb = cb;
  1180          cb_arg.skb = skb;
  1181          cb_arg.seq = cb->nlh->nlmsg_seq;
  1182  
  1183          rcu_read_lock();
  1184          for (iter_bkt = skip_bkt;
  1185               iter_bkt < rcu_dereference(netlbl_unlhsh)->size;
  1186               iter_bkt++) {
  1187                  iter_list = &rcu_dereference(netlbl_unlhsh)->tbl[iter_bkt];
  1188                  list_for_each_entry_rcu(iface, iter_list, list) {
  1189                          if (!iface->valid ||
  1190                              iter_chain++ < skip_chain)
                                    ^^^^^^^^^^^^
warning here.

  1191                                  continue;
  1192                          netlbl_af4list_foreach_rcu(addr4,
  1193                                                     &iface->addr4_list) {
  1194                                  if (iter_addr4++ < skip_addr4)
  1195                                          continue;
  1196                                  if (netlbl_unlabel_staticlist_gen(
  1197                                                NLBL_UNLABEL_C_STATICLIST,
  1198                                                iface,
  1199                                                netlbl_unlhsh_addr4_entry(addr4),
  1200                                                NULL,
  1201                                                &cb_arg) < 0) {
  1202                                          iter_addr4--;
  1203                                          iter_chain--;
  1204                                          goto unlabel_staticlist_return;
  1205                                  }
  1206                          }
  1207                          iter_addr4 = 0;
  1208                          skip_addr4 = 0;
  1209  #if IS_ENABLED(CONFIG_IPV6)
  1210                          netlbl_af6list_foreach_rcu(addr6,
  1211                                                     &iface->addr6_list) {
  1212                                  if (iter_addr6++ < skip_addr6)
  1213                                          continue;
  1214                                  if (netlbl_unlabel_staticlist_gen(
  1215                                                NLBL_UNLABEL_C_STATICLIST,
  1216                                                iface,
  1217                                                NULL,
  1218                                                netlbl_unlhsh_addr6_entry(addr6),
  1219                                                &cb_arg) < 0) {
  1220                                          iter_addr6--;
  1221                                          iter_chain--;
  1222                                          goto unlabel_staticlist_return;
  1223                                  }
  1224                          }
  1225                          iter_addr6 = 0;
  1226                          skip_addr6 = 0;
  1227  #endif /* IPv6 */
  1228                  }
  1229                  iter_chain = 0;
  1230                  skip_chain = 0;
  1231          }
  1232  
  1233  unlabel_staticlist_return:
  1234          rcu_read_unlock();
  1235          cb->args[0] = iter_bkt;
  1236          cb->args[1] = iter_chain;
  1237          cb->args[2] = iter_addr4;
  1238          cb->args[3] = iter_addr6;
  1239          return skb->len;
  1240  }

regards,
dan carpenter
