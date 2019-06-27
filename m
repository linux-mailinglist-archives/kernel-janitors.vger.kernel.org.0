Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A48C57CF6
	for <lists+kernel-janitors@lfdr.de>; Thu, 27 Jun 2019 09:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfF0HPf (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jun 2019 03:15:35 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:46472 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfF0HPf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jun 2019 03:15:35 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7EIQc166417;
        Thu, 27 Jun 2019 07:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=p2X+JVbJ5o0EqLYpgLUvQQzWeLdP1wK1qV9gioCssZM=;
 b=PCvB6lNBormgSrc2vPgUdwH8b3ORgsewHDocZwXHuKggSN6m5g4csLt/XVQfSHQqB3pA
 NehbVdj4Pbho+3+r+Wzy5wp/NHlDj8m9NdOSu+/KZvDNxUAwTCIQW9VqWD7wJLUWEF3v
 5oz31p9gT/09yp8g+3IVij4E7II2xBkRBqZR+vy3m+3VIycU30MznkLiyXJ7gONGgFBW
 21YnkWiI78cMWLB5JDycfG/HKOpvlfFkWouzoVsPvRol065335rFKJTFdKB61vRp9jrm
 RoJZFtPcJ5gh71HWDfRmb+MgihdyqLEfdouoz0Bo48ZUVYMYR0lNd1r1VTN4234+PLLr jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2t9c9pxf8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:15:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7FU9U032686;
        Thu, 27 Jun 2019 07:15:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2tat7d7axp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:15:30 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5R7FRlA027091;
        Thu, 27 Jun 2019 07:15:27 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 00:15:26 -0700
Date:   Thu, 27 Jun 2019 10:15:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vincenzo.frascino@arm.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] lib/vdso: Provide generic VDSO implementation
Message-ID: <20190627071521.GA22903@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=578
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=624 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vincenzo Frascino,

This is a semi-automatic email about new static checker warnings.

The patch 00b26474c2f1: "lib/vdso: Provide generic VDSO
implementation" from Jun 21, 2019, leads to the following Smatch
complaint:

    arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:120 __cvdso_clock_gettime32()
    error: we previously assumed 'res' could be null (see line 107)

lib/vdso/gettimeofday.c
   101  static __maybe_unused int
   102  __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
   103  {
   104          struct __kernel_timespec ts;
   105          int ret;
   106	
   107		if (res == NULL)
                    ^^^^^^^^^^^
   108			goto fallback;
   109	
   110		ret = __cvdso_clock_gettime(clock, &ts);
   111	
   112		if (ret == 0) {
   113			res->tv_sec = ts.tv_sec;
   114			res->tv_nsec = ts.tv_nsec;
   115		}
   116	
   117		return ret;
   118	
   119	fallback:
   120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
                                                                                 ^^^
On x86 this "res" always gets dereferenced.

   121	}

regards,
dan carpenter
