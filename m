Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C0F162124
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Feb 2020 07:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgBRGue (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Feb 2020 01:50:34 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40510 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgBRGue (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Feb 2020 01:50:34 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I6ls94176860;
        Tue, 18 Feb 2020 06:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=xDgUWylF7aVdT/6+XvceCHjN2sLJ0ogm2knOMjYQZlY=;
 b=u1fhxbgYx8FCYmWHzzv8R2zXKZb0VwizpupQnx7TIx11gaGeOpordpnj0lqZS0SP1OXI
 itG1eFJLN27txz3wRVriXasFr+axvO9zFKJPz1kfJVpTDK8Gh/1el16LZC8S+pDEnWUK
 AOcn29BSOv4t1O1U7Myz4gAQnghaPHJotxRv8nDnYO5jw6tDgWBPsg9ZewniRqvCXuCt
 VHNNj3A4LxaI1vL918uKQ5DoJfNiwKcD1WgyiHLDkwcYnBTKEaElwhajHtjmTUTKwovs
 v5PyieOBuHjNCU7S3bFC8iUp/k3By479Abg3kxSJcEUzb2J65epHK2U76Ne+d/2kMSfJ UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2y699rkgbn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Feb 2020 06:50:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I6mSfg090817;
        Tue, 18 Feb 2020 06:48:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2y82c0vc6r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Feb 2020 06:48:27 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01I6mQeo013730;
        Tue, 18 Feb 2020 06:48:26 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Feb 2020 22:48:06 -0800
Date:   Tue, 18 Feb 2020 09:47:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     christian.brauner@ubuntu.com
Cc:     Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] clone3: allow spawning processes into cgroups
Message-ID: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=41 malwarescore=0 adultscore=0
 phishscore=0 spamscore=41 suspectscore=1 mlxscore=41 mlxlogscore=15
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=18 phishscore=0 suspectscore=1
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=18 impostorscore=0
 mlxlogscore=65 lowpriorityscore=0 spamscore=18 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180054
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Christian Brauner,

The patch ef2c41cf38a7: "clone3: allow spawning processes into
cgroups" from Feb 5, 2020, leads to the following static checker
warning:

	kernel/fork.c:2632 copy_clone_args_from_user()
	warn: unsigned 'args.cgroup' is never less than zero.

kernel/fork.c
  2598  noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
  2599                                                struct clone_args __user *uargs,
  2600                                                size_t usize)
  2601  {
  2602          int err;
  2603          struct clone_args args;
  2604          pid_t *kset_tid = kargs->set_tid;
  2605  
  2606          if (unlikely(usize > PAGE_SIZE))
  2607                  return -E2BIG;
  2608          if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
  2609                  return -EINVAL;
  2610  
  2611          err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
  2612          if (err)
  2613                  return err;
  2614  
  2615          if (unlikely(args.set_tid_size > MAX_PID_NS_LEVEL))
  2616                  return -EINVAL;
  2617  
  2618          if (unlikely(!args.set_tid && args.set_tid_size > 0))
  2619                  return -EINVAL;
  2620  
  2621          if (unlikely(args.set_tid && args.set_tid_size == 0))
  2622                  return -EINVAL;
  2623  
  2624          /*
  2625           * Verify that higher 32bits of exit_signal are unset and that
  2626           * it is a valid signal
  2627           */
  2628          if (unlikely((args.exit_signal & ~((u64)CSIGNAL)) ||
  2629                       !valid_signal(args.exit_signal)))
  2630                  return -EINVAL;
  2631  
  2632          if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
                                                        ^^^^^^^^^^^^^^^
This is a u64 so it can't be negative.  I'm not sure what was intended.

  2633                  return -EINVAL;
  2634  

regards,
dan carpenter
