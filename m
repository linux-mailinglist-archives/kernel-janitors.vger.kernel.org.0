Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462E117389
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 10:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfEHITS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 04:19:18 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50510 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfEHITR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 04:19:17 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488E6tZ069509;
        Wed, 8 May 2019 08:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=18WjS2ZtVPWOo1P/1dkHFHwQ8A5cI7YKujx+uFWbLfs=;
 b=Jw1a2cuDxh+E2hh//uedCq48KhlV7Aw5/jYKN9o13Odil09ciDF3Zz/6j6Re96WXFGz0
 lbII2O4SjeLRtOGMqVrLb6ajGmbvArjeLuRLjhHQIdtAs5B76V7b0zvaQt8D4/07lBfe
 x1vzGi3qdkLPF7e/1/8N6IHgBAkNfxPLyf0n/uvkPFwnMg0xZ5tIXM1xJ/pJNnLLTLnM
 2ksZBvbYag5cYFAJ8pHFOBPxieAtIr9MYINRHfPu6pNXW1nCO29+vMBVW7raSZwMZT01
 wvG8LGjVTVn4s81qq94OfApen5FzyhzZ8nIQiGtsGGy9JuwHHrvrcdlnCPoH61e1Ziel Eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2s94bg26up-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 08:19:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488HKPm169425;
        Wed, 8 May 2019 08:19:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2s94afxycy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 08:19:15 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x488JDpY017945;
        Wed, 8 May 2019 08:19:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 May 2019 01:19:13 -0700
Date:   Wed, 8 May 2019 11:19:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net/sched: use the hardware intermediate
 representation for matchall
Message-ID: <20190508081907.GX2239@kadam>
References: <20190508071704.GA11889@mwanda>
 <6ce3bc18-94e8-298f-8ae5-1db9608ee575@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce3bc18-94e8-298f-8ae5-1db9608ee575@netronome.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080053
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080053
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 08, 2019 at 08:41:13AM +0100, Pieter Jansen van Vuuren wrote:
> On 08/05/2019 08:17, Dan Carpenter wrote:
> > Hello Pieter Jansen van Vuuren,
> > 
> > The patch f00cbf196814: "net/sched: use the hardware intermediate
> > representation for matchall" from May 4, 2019, leads to the following
> > static checker warning:
> > 
> > 	net/sched/cls_matchall.c:317 mall_reoffload()
> > 	error: double free of 'cls_mall.rule'
> > 
> > net/sched/cls_matchall.c
> >    286  static int mall_reoffload(struct tcf_proto *tp, bool add, tc_setup_cb_t *cb,
> >    287                            void *cb_priv, struct netlink_ext_ack *extack)
> >    288  {
> >    289          struct cls_mall_head *head = rtnl_dereference(tp->root);
> >    290          struct tc_cls_matchall_offload cls_mall = {};
> >    291          struct tcf_block *block = tp->chain->block;
> >    292          int err;
> >    293  
> >    294          if (tc_skip_hw(head->flags))
> >    295                  return 0;
> >    296  
> >    297          cls_mall.rule = flow_rule_alloc(tcf_exts_num_actions(&head->exts));
> >    298          if (!cls_mall.rule)
> >    299                  return -ENOMEM;
> >    300  
> >    301          tc_cls_common_offload_init(&cls_mall.common, tp, head->flags, block,
> >    302                                     extack);
> >    303          cls_mall.command = add ?
> >    304                  TC_CLSMATCHALL_REPLACE : TC_CLSMATCHALL_DESTROY;
> >    305          cls_mall.cookie = (unsigned long)head;
> >    306  
> >    307          err = tc_setup_flow_action(&cls_mall.rule->action, &head->exts);
> >    308          if (err) {
> >    309                  kfree(cls_mall.rule);
> >                         ^^^^^^^^^^^^^^^^^^^
> >    310                  if (add && tc_skip_sw(head->flags)) {
> >    311                          NL_SET_ERR_MSG_MOD(extack, "Failed to setup flow action");
> >    312                          return err;
> >    313                  }
> > 
> > My guess is that there should be a "return err;" here?
> 
> Thank you. Yes, I think this should be "return 0;" instead of "return err;"

You would know the code better, than I.  :)

Could you send a patch to Dave?  The merge window is open but he still
accepts bug fixes.

regards,
dan carpenter
