Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5540B1525C5
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Feb 2020 06:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgBEFNm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 5 Feb 2020 00:13:42 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34834 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgBEFNm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Feb 2020 00:13:42 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 01558fBG108921;
        Wed, 5 Feb 2020 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=jzrUOR0zEUZf+BomtNotc9zbcdNh22l8pqWUOKpPJuY=;
 b=NcEecMBo/5eL9hXvYTKPOYxokFACfhorpd2TaI9xIXxF58WX8VSScktlhdXh0dM5n18z
 afrLeFWJGFRcyK//Aizqx7sATjSgTxo3xwEYXpjc5JuGCuftBQyQ7BYolEhzFjYdx8aA
 wqjwISkCe/51GpVTHqepRZPtZdPvNk8xOqcHedaN+FTNXNVq7ypfXPdiR+Kr9spa7S8A
 /UzOuwK3MguG8/dFUKzWY/ZYO+geDDyjOloT++4ev085jQchbY2flBGYfHo23AYkI+Jw
 p82m6+j8/daJeLlhHMitfkI2ac10dnLE5PIIaUhe9OfIE3boEyi5b67QwE6xI8B8WNNp RA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xykbp0quy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 05:13:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 01558si1041201;
        Wed, 5 Feb 2020 05:11:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2xykc1vt79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 05 Feb 2020 05:11:38 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0155Bb6i001661;
        Wed, 5 Feb 2020 05:11:37 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 04 Feb 2020 21:11:37 -0800
Date:   Wed, 5 Feb 2020 08:11:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     keith.busch@intel.com
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] node: Add memory-side caching attributes
Message-ID: <20200205051130.iiieepxhebjo76di@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=882
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050042
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=931 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050042
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Keith Busch,

The patch acc02a109b04: "node: Add memory-side caching attributes"
from Mar 11, 2019, leads to the following static checker warning:

	drivers/base/node.c:279 node_init_cache_dev()
	error: kfree after device_register(): 'dev'

drivers/base/node.c
   257  static void node_init_cache_dev(struct node *node)
   258  {
   259          struct device *dev;
   260  
   261          dev = kzalloc(sizeof(*dev), GFP_KERNEL);
   262          if (!dev)
   263                  return;
   264  
   265          dev->parent = &node->dev;
   266          dev->release = node_cache_release;
   267          if (dev_set_name(dev, "memory_side_cache"))
   268                  goto free_dev;
   269  
   270          if (device_register(dev))
   271                  goto free_name;
   272  
   273          pm_runtime_no_callbacks(dev);
   274          node->cache_dev = dev;
   275          return;
   276  free_name:
   277          kfree_const(dev->kobj.name);
   278  free_dev:
   279          kfree(dev);
                ^^^^^^^^^^
Genereally we can't call kfree() after calling device_register().

   280  }

regards,
dan carpenter
