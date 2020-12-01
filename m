Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957DE2CAAB1
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Dec 2020 19:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgLASYu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 1 Dec 2020 13:24:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46656 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgLASYu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Dec 2020 13:24:50 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1I8tt9067158;
        Tue, 1 Dec 2020 18:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wYZA9gFuXDkuJ7dqkU9nyEY9s9l59xrzx0fVuoYexQA=;
 b=uqxqCRFDqWCk/WFUQE/eedl33+Q0PMOeGSGmpXP8grcy0qkPMyI9UJwZ9Nw42y+UB+5s
 ITg7Fr3FfXMT7HYC7PrhmbJXDw/M0/Cfiwfht5EEd19x7Hhkt5YSdnCMAJeZvSSLUhxd
 X86g1FY6jHW8RseOQjgloK8VWAndAxjTuJ2tNIcFWOOunFM7OgY3sZT1/m+er+jQPmDj
 SOrR9ACbtw1fmvmwJYmbj6D1+1lcB+xa7QRb4OcvqyMGmkIBeq4sAu2e2CYdqQaaVs8W
 ABGol9JDe+iXh3p1zkm8MyFKzRL5zpVKhRbLOFrlTI9znnVxoAGW+7t/A5GD0++k/Z68 zg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 353egkm2rg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 18:24:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1IATXe118533;
        Tue, 1 Dec 2020 18:24:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 35404n7dg6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 18:24:07 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1IO6vH008610;
        Tue, 1 Dec 2020 18:24:06 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 10:24:05 -0800
Date:   Tue, 1 Dec 2020 21:23:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs/core: Add blank line after variable
 declaration.
Message-ID: <20201201182358.GL2767@kadam>
References: <20201130214749.GA381950@a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130214749.GA381950@a>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010111
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Matthew,

Someone already sent this patch a month back.  You should work against
linux-next so that you have the latest code.  Also kernel janitors
doesn't apply patches.  Send patches to the output from
scripts/get_maintainer.pl

Otherwise it looks fine though and Greg would have applied it if he
hadn't already applied someone else's.

regards,
dan carpenter

