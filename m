Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F711515FD
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Feb 2020 07:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgBDG17 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 4 Feb 2020 01:27:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36406 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgBDG17 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Feb 2020 01:27:59 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014687Nc134548;
        Tue, 4 Feb 2020 06:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=u/G+KOX+LjtSK03l2X8IFjsVt+vBtMXHKVHpaogp/qU=;
 b=IfZNu7s3VIl9MxayTKvHf2zLY1LNM9yCRZ5w/ngeJ2NU49LGAsVJHVWu5UOuczONiwjz
 F7nn2s/LyA8FIA2zfoDlfSeVPuuJJeGrrxRPItpHXJ11oyiK/LTmBRrBzraHXGtG+c9x
 0D5eYb0O+Ji8EG2dsxNfCc4y1HcZbpprED3GmEafk9k5thLAojl3+DWSA34h7Xlc0IXo
 +a/XFtk0CDldICboNYPeJn5vvPeZRgCiY/hc/egVBzO7rpGYizEF8A6Ef4kaZEx9cfxR
 5hy0sWUp7rRpL9rFE0MLuTBF/BM83ZRXCwkLmgFbb9wxvJyOvFAJ+3/SPKzScF9gA/h7 OA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2xw19qcdn4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 06:27:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0146I9eJ074833;
        Tue, 4 Feb 2020 06:27:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2xxvuqwyn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 06:27:56 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0146RtmT020587;
        Tue, 4 Feb 2020 06:27:55 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 22:27:55 -0800
Date:   Tue, 4 Feb 2020 09:27:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lauri Jakku <ljakku77@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB HID random timeout failures fixed by trying 20 times
Message-ID: <20200204062749.GP1778@kadam>
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040046
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Lauri,

There are a bunch of issues with this patch.

1)  There is no way we're going to add a retry loop to
    usb_control_msg().  We might add it to a driver, but probably we
    would suspect that the hardware is bad.  Maybe the cable is faulty?
    Or I could be wrong on that...

2)  You would need to send this to a different list.  Use
    ./scripts/get_maintainer.pl to find out who.  The
    linux-usb@vger.kernel.org is the main USB list.

3)  The patch doesn't apply.  Read the first paragraph of
    Documentation/process/email-clients.rst

4) The subject needs to be formatted slightly differently.
    [PATCH] USB: HID: Fix timeout by adding retry loop

5) The commit message should be more clear what was affected.  Don't
   start the commit message in the middle of a sentence.

regards,
dan carpenter


