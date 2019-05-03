Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2007C12DDE
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 May 2019 14:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbfECMob (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 3 May 2019 08:44:31 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:46346 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfECMob (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 May 2019 08:44:31 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43CiHR1112298;
        Fri, 3 May 2019 12:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=DVOmBhaMgCUuocEuuCiTqUCYSgYEXsRv8b3igDxKSug=;
 b=i2nPpUh74wDXc+UT50IymXzJlKOfjASgEEnfTr2NmHQjlZNK9TXteQ4y08QlAsoeKPgV
 cdUSALlppjXhicl/gpIye+zfKHv9epDEJVNjRQy/vTvpJGpXQK+S3l6vdSeo55jew7bY
 M4lnK+kqc7+y+0yiZLUzM9jRvvwEqhKqwFYuu/6V8rZogAzCfAd4jT0295NzA9jAhfYh
 71bufktbBPfCrDTIyiDq307x23wIHBEOLdQgX6rQerevWOUnAwt5dqr6Pq2GJNXbxKuX
 3n5X9Bg0jFFyD0XBXSjRV4vhvp0etcyrlOp4lC1DTX2trEaxcoMrwRxLLK7k+/db3L4X xw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 2s6xhypf1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 12:44:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43Ch8jO072219;
        Fri, 3 May 2019 12:44:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2s6xhhks44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 May 2019 12:44:25 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x43CiMTN030374;
        Fri, 3 May 2019 12:44:23 GMT
Received: from mwanda (/196.104.111.181)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 03 May 2019 05:44:22 -0700
Date:   Fri, 3 May 2019 15:44:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     maxime.chevallier@bootlin.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: mvpp2: cls: Add Classification offload support
Message-ID: <20190503124412.GE29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=858
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030080
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=882 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030080
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Maxime Chevallier,

The patch 90b509b39ac9: "net: mvpp2: cls: Add Classification offload
support" from Apr 30, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1036 mvpp2_port_c2_tcam_rule_add()
	warn: unsigned 'c2.index' is never less than zero.

drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
  1026  static int mvpp2_port_c2_tcam_rule_add(struct mvpp2_port *port,
  1027                                         struct mvpp2_rfs_rule *rule)
  1028  {
  1029          struct flow_action_entry *act;
  1030          struct mvpp2_cls_c2_entry c2;
  1031          u8 qh, ql, pmap;
  1032  
  1033          memset(&c2, 0, sizeof(c2));
  1034  
  1035          c2.index = mvpp2_cls_c2_port_flow_index(port, rule->loc);
  1036          if (c2.index < 0)
                    ^^^^^^^^^^^^
This is unsigned and also mvpp2_cls_c2_port_flow_index() doesn't return
negative error codes.

  1037                  return -EINVAL;
  1038  
  1039          act = &rule->flow->action.entries[0];
  1040  
  1041          rule->c2_index = c2.index;
  1042  


regards,
dan carpenter
