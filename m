Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE02E8523
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Oct 2019 11:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbfJ2KJD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Oct 2019 06:09:03 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:46426 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbfJ2KJC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Oct 2019 06:09:02 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TA8ugw127394;
        Tue, 29 Oct 2019 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=CXbsHX3JMDlLrzK5hWsFb7LzrjnLuOYQd/QQ0sFPLnk=;
 b=LPMPucgdcACw2HyQZXqGA0muE3ggSOGsee0ExCUTQGboIJXBBI4nib9oWyxS7QDYMQDn
 5kwkWfO2MbqDCaei3WS0U+Ra+STLaYUef9YTWxyFqFWjwdyyV+DfAThKNIsGVqW3PLnw
 Sg/amMAdMfkr2p5V1z6HeHKkZSZrRf103/CGnvR4kX/hqkmCMeiuyOdCHVBYhBHpxuqu
 /GGGEsv38Fdu5bFs9vK+h4XOBv5StshICTkzalsEHkc4wQezyKix0rUg4C1zOA3h2EdL
 uoXDcuq1pRK0ZkGXkSs0XCNhBiTo3EoCpzvf/UbysiAKdoHb8dffzDLd02oyETAdh0po 3Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2vvdju869j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 10:08:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TA8gta057060;
        Tue, 29 Oct 2019 10:08:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2vxj3tnkm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 10:08:50 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TA80QD009429;
        Tue, 29 Oct 2019 10:08:01 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Oct 2019 03:08:00 -0700
Date:   Tue, 29 Oct 2019 13:07:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Igor Russkikh <irusskikh@marvell.com>
Cc:     Egor Pomozov <epomozov@marvell.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Igor Russkikh <Igor.Russkikh@aquantia.com>
Subject: Re: [EXT] [bug report] net: aquantia: add basic ptp_clock callbacks
Message-ID: <20191029100754.GG1922@kadam>
References: <20191028113158.GA32279@mwanda>
 <72AB2F04-F7D8-423C-9191-9373D53B1B59@marvell.com>
 <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9b7262-d259-5fb1-0f4e-6634ed687284@marvell.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290106
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 09:14:33AM +0000, Igor Russkikh wrote:
> 
> On 28.10.2019 18:25, Egor Pomozov wrote:
> > Hello Dan,
> > +Igor
> > 
> > Thank you for pointing the issue. We’ll fixed soon.
> 
> 
> >>  1207          clock = ptp_clock_register(&aq_ptp->ptp_info, &aq_nic->ndev->dev);
> >>  1208          if (!clock || IS_ERR(clock)) {
> >>  1209                  netdev_err(aq_nic->ndev, "ptp_clock_register failed\n");
> >>  1210                  err = PTR_ERR(clock);
> >>  1211                  goto err_exit;
> >>
> >> This is a false positive in Smatch but the code is still problematic.
> >>
> >> The issue is that ptp_clock_register() returns error pointers if there
> >> is an error and it returns NULL if the clock is disabled in the config.
> >> If "clock" is NULL then this code returns PTR_ERR(NULL) which is
> >> success but so that's a bug.
> >>
> >> The question is, is it really realistic for people to run this hardware
> >> without a ptp clock?  If so then we should allow it instead of erroring
> >> out here when clock is NULL.  If not then we should enforce that in the
> >> Kconfig instead of waiting until runtime.
> 
> Hi Dan, I'd say thats a false positive.
> There exist HW configuration where PTP is disabled or not available.
> 
> PTR_ERR(NULL) is 0, so eventually driver now functions correctly, allowing to
> proceed but marking ptp functionality as disabled.
> 
> I agree that's a bit counterintuitive but correct.

I have looked at it again and the "!clock" check should be removed
because it is dead code.  It's not possible for it to be NULL there
because aq_ptp_init() is a dummy function if the PTP clock is not
enabled.

regards,
dan carpenter
