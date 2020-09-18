Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF8E26FA87
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Sep 2020 12:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgIRKYp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 18 Sep 2020 06:24:45 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60842 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgIRKYp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Sep 2020 06:24:45 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IAIvr2136352;
        Fri, 18 Sep 2020 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=YIQ+pqx5MHomeW8ONDClAvRge5vIF7kJjWgkK0b6Pek=;
 b=HgKM4aNEqh37ApWq/xygJfBAWFtj4YUVawYqxzsFdidt30r6AnmWmEbMoO9qxcoY6Tkp
 lfToZYsq1XY4j8j+IZUvxkDLjNoTJycA1eF7AVcljV/a8Dt1GUxJZX2N1y+ofQcmc7sW
 kB1Z3PYJgeYCoGqGgODug5LlwmoDOUr3BvZyU7TOzQGy5j1V/NfTWRZH4D9F8q8CptNF
 mv/75/qDHPvi/aU1QI2RU6hYpDRL8pc4K9mF1+SLbWj9820uErCRF9luEaKa2hp1VACp
 Z9GaKI7ZyMRAikYXBAAJZBQA1j1g2Uf3a+Lln5U+MQEJo4PxETeXjUI3FjRM3p84lgti dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 33gp9mpc06-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Sep 2020 10:24:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08IAJa90022956;
        Fri, 18 Sep 2020 10:24:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 33h88e4bch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Sep 2020 10:24:41 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08IAOdFA029174;
        Fri, 18 Sep 2020 10:24:40 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Sep 2020 10:24:39 +0000
Date:   Fri, 18 Sep 2020 13:24:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     snelson@pensando.io
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ionic: dynamic interrupt moderation
Message-ID: <20200918102434.GA892838@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=3 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=377
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=392
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=3 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180084
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Shannon Nelson,

This is a semi-automatic email about new static checker warnings.

The patch 04a834592bf5: "ionic: dynamic interrupt moderation" from 
Sep 15, 2020, leads to the following Smatch complaint:

    drivers/net/ethernet/pensando/ionic/ionic_lif.c:855 ionic_adminq_napi()
    error: we previously assumed 'lif->adminqcq' could be null (see line 848)

drivers/net/ethernet/pensando/ionic/ionic_lif.c
   847	
   848		if (lif->adminqcq && lif->adminqcq->flags & IONIC_QCQ_F_INITED)
                    ^^^^^^^^^^^^^
Existing code checks for NULL

   849			a_work = ionic_cq_service(&lif->adminqcq->cq, budget,
   850						  ionic_adminq_service, NULL, NULL);
   851	
   852		work_done = max(n_work, a_work);
   853		if (work_done < budget && napi_complete_done(napi, work_done)) {
   854			flags |= IONIC_INTR_CRED_UNMASK;
   855			lif->adminqcq->cq.bound_intr->rearm_count++;
                        ^^^^^^^^^^^^^^^
The patch adds a new unchecked dereference

   856		}
   857	

regards,
dan carpenter
