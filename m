Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9EDEB029E
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 19:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfIKRY7 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 13:24:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52756 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIKRY7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 13:24:59 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BHNx0G181328;
        Wed, 11 Sep 2019 17:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=VWik13ipRm/Hq5xXs2BO/ZA9+psKkHTYcDciUtPvFGk=;
 b=FOlnkmNMYpZSJciKOEf8UOquN/Ieu7QWq/eYhP/64U5tZ9Iu+grNzpsOT+coBCCeEZh4
 CGQL8IGXTgfhYUfzN3MpgDhpsFtXT4YctwTm7oeWfyp0cJBkyFjHgfovfGYKR7Z9TFBD
 djSYrBNLrxdO2XrVOKKo+rWTeSiQXOzu4r5W7MlQJK+k++D0P/ChjuwX3+V4ZhQVylPA
 nCKRY4EmjYj4J+yAIL1vl0F92EGefDDHq7q8jliqgpCgQZ2/HPeSkoaYnbymHTZKC1Mb
 G5CRwH0arIsyUxrnH8l10geCt9CHrGPSNz81dxE6+Dx6BVrtc/Wa+GlST4njo5Htqxzh 4g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2uw1m93nwb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Sep 2019 17:24:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8BHOL9V006379;
        Wed, 11 Sep 2019 17:24:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2uxk0tfbpr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Sep 2019 17:24:33 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8BHOTtE032582;
        Wed, 11 Sep 2019 17:24:30 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 11 Sep 2019 10:24:29 -0700
Date:   Wed, 11 Sep 2019 20:24:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org,
        Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>,
        Eric Anholt <eric@anholt.net>,
        linux-rpi-kernel@lists.infradead.org,
        Dominic Braun <inf.braun@fau.de>
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-ID: <20190911172422.GK20699@kadam>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
 <20190911142543.GA9873@SARKAR>
 <20190911144312.GL15977@kadam>
 <20190911150300.GA12027@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911150300.GA12027@SARKAR>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=693
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909110160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=763 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909110160
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 08:33:00PM +0530, Rohit Sarkar wrote:
> There are a lot of usages of "snprintf" throughout the staging
> directory (315 to be exact)
> Would it be worthwhile to find ones that may cause an information leak
> and replace them with "scnprintf"?

A lot of times it's really easy to see that the uses are safe, so
snprintf() is fine in that case.  If it's not obviously safe then change
it.

regards,
dan carpenter

