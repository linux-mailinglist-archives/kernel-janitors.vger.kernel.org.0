Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C713114D09
	for <lists+kernel-janitors@lfdr.de>; Fri,  6 Dec 2019 08:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfLFH6q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 6 Dec 2019 02:58:46 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:43444 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfLFH6p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Dec 2019 02:58:45 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB67uYda080172
        for <kernel-janitors@vger.kernel.org>; Fri, 6 Dec 2019 07:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=aD1C7D+PMbopFPa76vSQwHkSaqPJ/ALl0i38GTWHJhI=;
 b=EAzfahQk/MLjjW3YiKXE7XET3fWEnKZLFEWZ/78CD5aXlbhgnmCPuBJz1VO8abeQATLC
 Cie0CHMtX6jHYMi9Cf4eWmR412EkE1ZBONNsecN4pCVczB0Lc6OWuuFjyovfpBTN7+zD
 DFBvS7cH99EfpU8p/9zGzsQsuiVAetoUho+OQy3xuzpyPnh2sBGjvWCckuXOb5APgZcf
 wgXbl9qqJ1yY/HnnvdhMHm9ZLziyFfXtrKRHbD6pfy3YYbYg5gYl6emj9AaRgv2/vEcn
 GvsCC/L/QP7w7bR11D23r0+/UUHlV67nLjt1MO7+7XaWBZEgvmhROkA5IIiMw7XLX/Iy oQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2wkh2rt7s4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2019 07:58:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB67scSH118721
        for <kernel-janitors@vger.kernel.org>; Fri, 6 Dec 2019 07:56:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2wptq0nq74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2019 07:56:43 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB67ugpc002337
        for <kernel-janitors@vger.kernel.org>; Fri, 6 Dec 2019 07:56:42 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Dec 2019 23:56:41 -0800
Date:   Fri, 6 Dec 2019 10:56:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kernel-janitors@vger.kernel.org
Subject: A couple TODO ideas
Message-ID: <20191206075636.GI1765@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9462 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=612
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912060068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9462 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=1 spamscore=0 clxscore=1015
 lowpriorityscore=1 mlxscore=0 impostorscore=0 mlxlogscore=696 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912060068
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sudip and I have started a #syzkaller channel on OFTC irc.  The idea is
that if people are working on bugs from the syzbot dashboard and run
into any issues or have questions they could ask them their.

Another idea that is that someone could write a scripts/email_patch.sh
script.  You could either give it a just a <commit id> or a <start> and
<end> commit id.  Maybe there would be a --to=<email@address.com> option
but by default it would just use get_maintainer.pl.

It would be an interactive script for first timers.  It would do some
QC like trying to run checkpatch and Sparse with --endian flags.  Stuff
like looking at the patch prefix.  Here is what I use to send my
patches.

https://repo.or.cz/smatch.git/blob/HEAD:/smatch_scripts/kpatch.sh

regards,
dan caprenter
