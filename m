Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022F51726F
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfEHHRO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 03:17:14 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43492 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfEHHRO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 03:17:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487EiXk039605;
        Wed, 8 May 2019 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=1AK/9gVQ1WSkfAequc1snVXcaWExqhQW96oKjkChG4I=;
 b=OvwJZ/dAK28OE87M8VfnP8AMIYDORvXTVS/XIj/OwrJD0ziOYTdgW8UwVu9nEVGGo/3y
 ZBduicuSEOV2PjqXC+uPx1oevnAxGk5KSwQov47gswATmFzpTzuBgsA2VLcXBZ4Phy6T
 R/pY/sabrBbRuvCblJIUi9QUQw9i24g7LUnrQ7vpBKRYqXmUIxGt0rgFDH1Mndgo8mrj
 pzVPHS+wXpKK1YC+ZNVu2aWKNrDC7CiDCFl8AniPBKjZowINQ6QMofz8xxrcbxgiX+Vg
 1I6fQKXXK8qJKHuohZFLzG1hNO+QH1JhpkiHctdCUYSjv2KgrhrunWV8TEh7VH2aOZ7K iA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2s94b0svug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:17:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487FtoH051524;
        Wed, 8 May 2019 07:17:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2sagyucqg9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:17:11 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x487HAl2020592;
        Wed, 8 May 2019 07:17:10 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 May 2019 00:17:09 -0700
Date:   Wed, 8 May 2019 10:17:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     pieter.jansenvanvuuren@netronome.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/sched: use the hardware intermediate representation
 for matchall
Message-ID: <20190508071704.GA11889@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080047
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080047
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Pieter Jansen van Vuuren,

The patch f00cbf196814: "net/sched: use the hardware intermediate
representation for matchall" from May 4, 2019, leads to the following
static checker warning:

	net/sched/cls_matchall.c:317 mall_reoffload()
	error: double free of 'cls_mall.rule'

net/sched/cls_matchall.c
   286  static int mall_reoffload(struct tcf_proto *tp, bool add, tc_setup_cb_t *cb,
   287                            void *cb_priv, struct netlink_ext_ack *extack)
   288  {
   289          struct cls_mall_head *head = rtnl_dereference(tp->root);
   290          struct tc_cls_matchall_offload cls_mall = {};
   291          struct tcf_block *block = tp->chain->block;
   292          int err;
   293  
   294          if (tc_skip_hw(head->flags))
   295                  return 0;
   296  
   297          cls_mall.rule = flow_rule_alloc(tcf_exts_num_actions(&head->exts));
   298          if (!cls_mall.rule)
   299                  return -ENOMEM;
   300  
   301          tc_cls_common_offload_init(&cls_mall.common, tp, head->flags, block,
   302                                     extack);
   303          cls_mall.command = add ?
   304                  TC_CLSMATCHALL_REPLACE : TC_CLSMATCHALL_DESTROY;
   305          cls_mall.cookie = (unsigned long)head;
   306  
   307          err = tc_setup_flow_action(&cls_mall.rule->action, &head->exts);
   308          if (err) {
   309                  kfree(cls_mall.rule);
                        ^^^^^^^^^^^^^^^^^^^
   310                  if (add && tc_skip_sw(head->flags)) {
   311                          NL_SET_ERR_MSG_MOD(extack, "Failed to setup flow action");
   312                          return err;
   313                  }

My guess is that there should be a "return err;" here?

   314          }
   315  
   316          err = cb(TC_SETUP_CLSMATCHALL, &cls_mall, cb_priv);
                      ^^
I did check whether the cb() function pointers re-allocate ->rule and
it doesn't look like it.

   317          kfree(cls_mall.rule);
                ^^^^^^^^^^^^^^^^^^^^
   318  
   319          if (err) {
   320                  if (add && tc_skip_sw(head->flags))
   321                          return err;
   322                  return 0;
   323          }

regards,
dan carpenter
