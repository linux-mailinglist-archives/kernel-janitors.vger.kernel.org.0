Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED414D881
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Jan 2020 11:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgA3KAV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 30 Jan 2020 05:00:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44086 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgA3KAV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 Jan 2020 05:00:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00U9wGsI080560;
        Thu, 30 Jan 2020 10:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=F03UeRI4Dxa+HjX7sp3z/pJ8mKI/k6KX19Bq6ksHqTo=;
 b=QupSsXFMMdlGhhA0mHlSjnSs8tIPOvOUG3xg8he9i9J0/Y3GLx8gs8Wlo7aN3QOPPuK7
 iPq9vcJzSJMBpiM6AvUW9fUfIVh9JnIU+GpCP6gjG0m+QSRSAFZIyNckYbaunUluK9aa
 z1g8Q1/KnKNWjYW3N1qQB3b7E3zuVUWLNEd4S8B3rIAxQ17Th+5n4i9UihDSvWnbkouk
 RC9bLBzVpbMsCEaQz/svzoTzs5pjLxa/kLTAnb+itaCIlm3UuWx30l7WLDaWkk8p7ggS
 91PaIAauYKDkr0/qTDJXGHHUyx35fO1m74bsAVF3grzFSaOdSM3ABaARhpKD5Wlg5G8I Xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xrd3ujy2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Jan 2020 10:00:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00U9wHYV151525;
        Thu, 30 Jan 2020 10:00:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xu8e8bcs0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Jan 2020 10:00:18 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00UA0HY0011955;
        Thu, 30 Jan 2020 10:00:17 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 30 Jan 2020 02:00:16 -0800
Date:   Thu, 30 Jan 2020 13:00:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Raymond Deng <raymonddeng@ucsb.edu>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: Open tasks?
Message-ID: <20200130100009.GD1778@kadam>
References: <CAHM57JTr=-YT_7Z1p9SbqtD0wYJDixK9Sjo8ffVfb0oe8zt8MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHM57JTr=-YT_7Z1p9SbqtD0wYJDixK9Sjo8ffVfb0oe8zt8MA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9515 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001300071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9515 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001300071
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 08:36:32PM -0800, Raymond Deng wrote:
> Hi, are there open tasks for reasonably new people to do? Thanks.

The new hotest idea is to sign up for te syzbot mailing list and fix
bugs.

For example:
https://syzkaller.appspot.com/bug?extid=c37a14770d51a085a520

It has a c reproducer.  It has been bisected but if it's a race
condition, the git bisection could be suspect.  It affects v5.5-rc7
(It's in the dmesg, you need the version information for the lines to
match up).

My first thought was that it is an integer overflow but I can't see how
that would be possible.  Smatch said it was possible, but Smatch assumed
that we had set vc->vc_cols to an invalid number before the start.
Btw, using the Smatch `smdb.py where vc_cols` command is super helpful
for debugging these bugs.

Then my next thought was that it is a race condition but we're always
holding the console_lock() so I can't see how that works either...
Again for these things `smdb.py` really helps for examining the callers.
I'm working on recording when the caller is holding a lock but it's a
bit complicated and I'm not ready to push that code yet.

It's a mystery.

regards,
dan carpenter
