Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDB0142DAC
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jan 2020 15:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgATOhZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 09:37:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50784 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATOhZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 09:37:25 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00KEYuIV097972;
        Mon, 20 Jan 2020 14:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=S+lgcJ4GSoJ27pGhuDN5DERVgkkZwmtcWrJTLiaS4+s=;
 b=m+AX4i7oO+42qZfqUaOja9yvHaPu6IsJN/lqblvSmafn2duozik1Yk5CXQM5biP3zQS4
 7AoflBNiSM+ToMCHhApUxGBnYjia7xWG3MV/3fBLLHjbTHzh9pdddlEkMz+ZoFkoXyoi
 4neWMLeOKKghmBz11s44ndK3NGCOiJMKxAtwb3wHvAeoS3ro+3ReTHJ0v8ULjonIzjQM
 VFPHG3LdinVBp3pTqAkvQTWTMZm2rJXO3ix9kJXSpGEczn96bU/FDPEb3s4N345MJGlP
 SkjCka7ncQG3WoPMomxKMCW2OAeYnDbhHVoMa4GV2DDN9p6foKe0iw+RQzBz38swAKzi hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2xkseu7xsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jan 2020 14:37:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00KEYrww111646;
        Mon, 20 Jan 2020 14:37:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2xmbg8h3gn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jan 2020 14:37:20 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00KEbJ3j021357;
        Mon, 20 Jan 2020 14:37:19 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jan 2020 06:37:18 -0800
Date:   Mon, 20 Jan 2020 17:37:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     idosch@mellanox.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] netdevsim: fib: Add dummy implementation for FIB offload
Message-ID: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9505 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=747
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001200124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9505 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=812 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001200124
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ido Schimmel,

The patch 48bb9eb47b27: "netdevsim: fib: Add dummy implementation for
FIB offload" from Jan 14, 2020, leads to the following static checker
warning:

	drivers/net/netdevsim/fib.c:663 nsim_fib6_rt_insert()
	error: 'fib6_rt' dereferencing possible ERR_PTR()

drivers/net/netdevsim/fib.c
   460  nsim_fib6_rt_create(struct nsim_fib_data *data,
   461                      struct fib6_entry_notifier_info *fen6_info)
   462  {
   463          struct fib6_info *iter, *rt = fen6_info->rt;
   464          struct nsim_fib6_rt *fib6_rt;
   465          int i = 0;
   466          int err;
   467  
   468          fib6_rt = kzalloc(sizeof(*fib6_rt), GFP_ATOMIC);
   469          if (!fib6_rt)
   470                  return NULL;
                        ^^^^^^^^^^^

   471  
   472          nsim_fib_rt_init(data, &fib6_rt->common, &rt->fib6_dst.addr,
   473                           sizeof(rt->fib6_dst.addr), rt->fib6_dst.plen, AF_INET6,
   474                           rt->fib6_table->tb6_id);
   475  
   476          /* We consider a multipath IPv6 route as one entry, but it can be made
   477           * up from several fib6_info structs (one for each nexthop), so we
   478           * add them all to the same list under the entry.
   479           */
   480          INIT_LIST_HEAD(&fib6_rt->nh_list);
   481  
   482          err = nsim_fib6_rt_nh_add(fib6_rt, rt);
   483          if (err)
   484                  goto err_fib_rt_fini;
   485  
   486          if (!fen6_info->nsiblings)
   487                  return fib6_rt;
   488  
   489          list_for_each_entry(iter, &rt->fib6_siblings, fib6_siblings) {
   490                  if (i == fen6_info->nsiblings)
   491                          break;
   492  
   493                  err = nsim_fib6_rt_nh_add(fib6_rt, iter);
   494                  if (err)
   495                          goto err_fib6_rt_nh_del;
   496                  i++;
   497          }
   498          WARN_ON_ONCE(i != fen6_info->nsiblings);
   499  
   500          return fib6_rt;
   501  
   502  err_fib6_rt_nh_del:
   503          list_for_each_entry_continue_reverse(iter, &rt->fib6_siblings,
   504                                               fib6_siblings)
   505                  nsim_fib6_rt_nh_del(fib6_rt, iter);
   506          nsim_fib6_rt_nh_del(fib6_rt, rt);
   507  err_fib_rt_fini:
   508          nsim_fib_rt_fini(&fib6_rt->common);
   509          kfree(fib6_rt);
   510          return ERR_PTR(err);
                       ^^^^^^^^^^^^
   511  }

This function should either return NULL or error pointers but not both.

When a function returns a mix of error pointers and NULL, the NULL case
should be a special kind of success.  For example, we request a feature
like debugfs but it's disabled.  That's not an error, but we also can't
return a valid pointer to the debug fs file.

regards,
dan carpenter
