Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C57E19E6F5
	for <lists+kernel-janitors@lfdr.de>; Sat,  4 Apr 2020 20:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgDDSCu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 4 Apr 2020 14:02:50 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60360 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgDDSCu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Apr 2020 14:02:50 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 034Hrxwa077320;
        Sat, 4 Apr 2020 18:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ugnfJ1m8U0u56uCTL3+wGqLvy2NmybdX18gaB09SgT0=;
 b=KId2Y+BgiJTiv/NLLc57B4A3iLvLNiJ2oot5h0bvtes5ZMoRHr+cjz/iCQrDKoJnbmE6
 dD0dqp4nzZD+I/IVlQUijJlBAGO1ic6eEcnj62xlE9jKs2sbmdy/vrWPygPHjzw7HpQ6
 8fWcXq7BY7mtrKOlI6CppSJj4tMUIGTO+IO5eeXwP7Le0OZCTHWlNHwPs9UQOXareCkC
 0oqKGvZ0Txi32g4t9lMupMDX5epEP9YtyOaoyO4ytnG6SPFrrtN0Q6kh+jtfjuvBuPjI
 sgTJip54OL4As/wOlSXzEVxPVisXF1i8xfW54EIgmfB039LNUqCsdPVbw+iDg7kspvUw 8Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 306hnqsfen-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 04 Apr 2020 18:02:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 034HrNu5161682;
        Sat, 4 Apr 2020 18:02:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 306j21u8q9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 04 Apr 2020 18:02:46 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 034I2iUD010673;
        Sat, 4 Apr 2020 18:02:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 04 Apr 2020 18:02:44 +0000
Date:   Sat, 4 Apr 2020 21:02:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mkubecek@suse.cz
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ethtool: provide coalescing parameters with
 COALESCE_GET request
Message-ID: <20200404180238.GA173535@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9581 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004040166
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9581 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=3
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004040166
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Michal Kubecek,

The patch 217275453b3e: "ethtool: provide coalescing parameters with
COALESCE_GET request" from Mar 28, 2020, leads to the following
static checker warning:

	net/ethtool/coalesce.c:134 coalesce_put_u32()
	warn: signedness bug returning '(-90)'

net/ethtool/coalesce.c
   129  static bool coalesce_put_u32(struct sk_buff *skb, u16 attr_type, u32 val,
   130                               u32 supported_params)
   131  {
   132          if (!val && !(supported_params & attr_to_mask(attr_type)))
   133                  return false;
   134          return nla_put_u32(skb, attr_type, val);

This is done deliberately to return true on failure and false on
success but it causes a static checker warning.

   135  }
   136  
   137  static bool coalesce_put_bool(struct sk_buff *skb, u16 attr_type, u32 val,
   138                                u32 supported_params)
   139  {
   140          if (!val && !(supported_params & attr_to_mask(attr_type)))
   141                  return false;
   142          return nla_put_u8(skb, attr_type, !!val);

Same.

   143  }

regards,
dan carpenter
