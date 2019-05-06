Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A6514A40
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 May 2019 14:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfEFMwY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 May 2019 08:52:24 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52070 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfEFMwY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 May 2019 08:52:24 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CiMga148036;
        Mon, 6 May 2019 12:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=TO5p6U844mSabPmFZ/xowTJwJRPCrR8Q/DL//O5FccE=;
 b=kWIJ4hR/ElT3WJJ3fe6F9qJg/VK1EZFY7AYa6nWB12LVaP8SmC8i46bzpFSZAeyLHg5k
 FlIA1swniW7ao5FxIZrCAG7cA9E2b4CPqySePmPyIzCHkjkhkEsWsqLeV5ZHdX3mNNby
 wjcVrHpmHmeltdSbd47YLIR357fM/LBDQYwT49v5xyZcBmM8HkDdFJ/gW+ZloLZpRCyh
 nydTkZYZIWw3iDLKtL5hZS7CKPgIQIs6YAAXo7ITS990ynrEUtsbHrSAD10WPpWcu2Eo
 a9Z1m5ELMau+h22VQwj/zyy3vNmkvzpr1Z1IvDqlsnu+cC+pd0LGnYaKGqaMN/vbwDm7 Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2s94bfp8v6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 12:51:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CpF5G068622;
        Mon, 6 May 2019 12:51:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2s94aevtxf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 12:51:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46CpR8H025954;
        Mon, 6 May 2019 12:51:32 GMT
Received: from mwanda (/105.52.123.240)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 May 2019 05:51:26 -0700
Date:   Mon, 6 May 2019 15:51:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: synth: emux: soundfont.c: divide by zero in
 calc_gus_envelope_time()
Message-ID: <20190506125119.GB13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060112
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function is called from load_guspatch() and the rate is specified
by the user.  If they accidentally selected zero then it would crash the
kernel.  I've just changed the zero to a one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/synth/emux/soundfont.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 31a4ea94830e..9b5d70104489 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -856,6 +856,8 @@ calc_gus_envelope_time(int rate, int start, int end)
 	int r, p, t;
 	r = (3 - ((rate >> 6) & 3)) * 3;
 	p = rate & 0x3f;
+	if (!p)
+		p = 1;
 	t = end - start;
 	if (t < 0) t = -t;
 	if (13 > r)
-- 
2.18.0

