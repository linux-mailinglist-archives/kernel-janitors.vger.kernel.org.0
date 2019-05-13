Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794261B4BE
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 May 2019 13:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfEMLRl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 May 2019 07:17:41 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42443 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfEMLRl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 May 2019 07:17:41 -0400
Received: from [192.168.178.187] ([109.104.33.66]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MQeDw-1h5i9a2mhy-00NghP; Mon, 13 May 2019 13:17:16 +0200
Subject: Re: [PATCH] Staging: vc04_services: Fix a couple error codes
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Eric Anholt <eric@anholt.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Madhumitha Prabakaran <madhumithabiw@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Vatsala Narang <vatsalanarang@gmail.com>,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
References: <20190513110718.GA15764@mwanda>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <bdb03bff-f5e5-ef29-b009-ff9072347af1@i2se.com>
Date:   Mon, 13 May 2019 13:17:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513110718.GA15764@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:XlFuzwWOnVsq1wd6nHfLT+dtsctEpFSezEGI+eHGIX5x5ev2B+B
 ra7ruB7gElDAeaEE3oKQFHcatM6N7IU6M6TETT/cudWLTGk8f9KgqvJFf/btzdb65TNWnBi
 KXl3F5105Gj/cw7XNMMBQ71PyPIoM2HoyyV5WwwO0olpHJUR53+Hv2Xx43l4Eyix/BD3GMu
 8u295vMRatKCd2a4J4DBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cgkp6WuhVys=:l80pJeTc1O2wwW4YIOloHO
 vIsnPBr17j3pA3tpDaoKv5z0+sfuHsOBtM9IK5+sc0Q9+NT9UmdEAVlJkbC56PDmX5S4DWNQn
 LR59nwcQt9gQ22HGG27IYynJOtZgnIn2gS6CXR+Xir3Qz9LNvhtG5BWtYtnrtVG97s45SZ1lk
 O/P5SSCGadlnBan9r7LxzAEuYFO1QySZZhZoE5oJVAwDMUEqf/QtNQ4msoEBekT6ggkVFqqYj
 UiM8DHtZYI3u6vaW5rVZMIo+taitkFK/yxO3K1K3IYmzDXFf5runYFriel7AonEW9kPSJR8UG
 JqKV7SvxegNR1GbrLl6vLemWwL38xyWX6ItwLPPU3A0tODgm5MYLUHjCYJk3zp9NBDwGQyEdM
 4UBSb4T/nqk5L7R0TTfc4YfVxxqt1z3B+fPsP2iI/MsJVgjw9s9U6EFR7+70kivVD4COauhoo
 2qGtUVKaM3CAo3O/WklVanyDq/2pYaBKOO17Pj5MLkU7igQEvh6WBL9huPa9fp9rOJSAU+7lE
 SQ7Doi9E7DZmaX2Vyz+MKTYH6nE6z//+cD55l3+bFD9vR8BocRsSLr5zEHWFt6KEouenUtVdy
 oSEzewKAYEDc5mJDgN4wCskfZEVeKrra/2IfV9HHARShS0DwZlsVoJp4x/F1mhjkCaoqG2HRB
 Mr+6qj79sRP/8k3EIYGoUm0ScQXd4hidwU/giGEcLbUN5HGLvVkbox52X5kBx2KR7gyHf4seQ
 k3sbhZusMJhn/oh1o8fmdCG9vFyxPx1k2kxvSsMy8Y+RrA1o3jsphdHLW04=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 13.05.19 13:07, Dan Carpenter wrote:
> These are accidentally returning positive EINVAL instead of negative
> -EINVAL.  Some of the callers treat positive values as success.
>
> Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

