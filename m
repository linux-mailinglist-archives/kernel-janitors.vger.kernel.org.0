Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4C157D09
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 09:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfF0HST (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 03:18:19 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:54786 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfF0HST (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 03:18:19 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7E0wg052932;
        Thu, 27 Jun 2019 07:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=T2ihIQ1LUDVnPaJhFx32eliFdZc3jfOLuNbXKTkGE6U=;
 b=QoOy8Qftb3pN58HI7pojsCxf289ffEXsCcXvgDVhCGt0BTERGi01crM0C8XPgp4Sn/tV
 G9NZo93nYLJq4IurvrnWQvnKV4EHGCbHBhfnSlnUkSQlExiA0obzVCIiCWTMTlO+nv6q
 b2GoSqOkLF3AELgX63Ww0V2HI7eaM5YeQGT9sKm4q8gJZ7hCnFiCPK7lJMPlQw+RLq3X
 fJ5mIaBiuiaGIAbPUo6aIErQQqDPHnXf57YtGYP3F7KWqs2NW1m7cE/mvPlnRfBP+Y1n
 pYB7rv8Mh1ie5dSvt9kkQKk4j2TDuH0xtm1PGQG0NJ8ruMEcRAoaFdpndUegvzT82FU4 Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2t9brtehj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:18:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7IE2s039841;
        Thu, 27 Jun 2019 07:18:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2tat7d7c87-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:18:14 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5R7IDfl028774;
        Thu, 27 Jun 2019 07:18:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 00:18:13 -0700
Date:   Thu, 27 Jun 2019 10:18:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vincenzo.frascino@arm.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-ID: <20190627071743.GC5715@kadam>
References: <20190627071521.GA22903@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627071521.GA22903@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=579
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=641 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

See also __cvdso_clock_getres_time32().

lib/vdso/gettimeofday.c:226 __cvdso_clock_getres_time32() error: we previously assumed 'res' could be null (see line 213)

regards,
dan carpenter

