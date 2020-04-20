Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DDB1B0310
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Apr 2020 09:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDTHeh (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Apr 2020 03:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726061AbgDTHec (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Apr 2020 03:34:32 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1A2C061A0F
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 00:34:31 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id c17so3225501uae.12
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Apr 2020 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opCQWgYuAFYxLdRztezYqwdg+lsU+kLFUGlLQxUPDrg=;
        b=pAtkxvUGU+urLdOoGr0lXgvyKlRl16BlV9bPojdE8r0nGdNQq0Sf8j3kDMPzqsRTNX
         /LFbidWy/e3DGc29eEF6nu6yj59jxfAxBjHAb2EgMa+bg+B48EiqCITZNUxpRSsLnMrT
         1pAPf2rlHJV8chg1gtTC1AdvdJrNEq9jnheHYXDf0XqoLc1k7T/9W8DO+0mdau7N8LYG
         DLjtMznlnI3ljgsnfWjLUkhC+8JsNwrM8EnL6vcMmUgkJr/2MQGjDEJQS8mgEpIeVW0x
         b34kleywutIxcGdICiWzOZaLbd2j2BLBRJKRpKtHFv0Q+/EHjk5AYIBWRS5G/u16KQBh
         z7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opCQWgYuAFYxLdRztezYqwdg+lsU+kLFUGlLQxUPDrg=;
        b=IpAjsk/d8tjpOz8fvLkJ40F1Hhs4bOTMyEFVxLcB6/VPHTBzKY2HIfKyShnpISLZ3h
         U4JGv0wVWg9oQRQzZtEw/Nk6pNFtELvey1S1tXEYiT0rF0Vi4IMNnPYpH4D1v1KTptNm
         oC4o1DXZ0IVI2Vc6dwvQ59N1CZ5psJQjRnvBwSptyBy7xUapv1wj6EYutgkL+lXBbIFN
         2IKi9jPK5sIbzu3vt3GtV8BHeDRFkbIjUAeqRzbaaXnv4ApMM2RyaczMHHazeok4xCHT
         TAvf/wtJbaKQ2Wzov8/fnfw3Qd6oKR4lL0wMomSTPYMEo47DgRmnOLF57db0ewFZs6SQ
         IRFw==
X-Gm-Message-State: AGi0PuZmY/Nz5IdjXP8RkLvqBnI/Ue9fQcoc/wB8kizP2YdqtbHL8AdC
        mdNwTU8diMJpAdBDptQC4hRzAGJPHvfrt5fpFaSSGA==
X-Google-Smtp-Source: APiQypIP0+2cZRffzlocpbxn2ONEPkD5ue7l25ETDalvg1y0d5aVMpH/wBvI56nsmtEm2deJhKL1tD2ouDEFeELmEvY=
X-Received: by 2002:ab0:3343:: with SMTP id h3mr272200uap.19.1587368070353;
 Mon, 20 Apr 2020 00:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200417154901.112236-1-colin.king@canonical.com>
In-Reply-To: <20200417154901.112236-1-colin.king@canonical.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Apr 2020 09:33:54 +0200
Message-ID: <CAPDyKFocu+ckJE5WpMWuNTMJiwkfgQ4Ha-AXCF4mRJKMrhFa0A@mail.gmail.com>
Subject: Re: [PATCH][next] sdhci: arasan: fix uninitialized value being
 returned as error code
To:     Colin King <colin.king@canonical.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Manish Narani <manish.narani@xilinx.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 17 Apr 2020 at 17:49, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the error return value in variable ret is not being initialized
> and so a successful return path is returning a garbage value. Since ret
> is not being used the simple fix is just return 0 on a successful return.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch, but this time I have already applied [1] an
earlier fix for it.

Kind regards
Uffe

[...]

[1] https://patchwork.kernel.org/patch/11493633/
