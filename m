Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F171CBD96
	for <lists+kernel-janitors@lfdr.de>; Sat,  9 May 2020 06:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgEIEuO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 9 May 2020 00:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgEIEuN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 9 May 2020 00:50:13 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECCEC061A0C
        for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2020 21:50:13 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id i14so3004920qka.10
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2020 21:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o1JFY8qJmZXd/aUl9gDLLurD+wehBfsqo8Bz40G/nWw=;
        b=J16hc94Nk376MVeMGTdJs5OJAz/Ehej4THCEf4foNANL5Yu/B80oKDrU/aEmsxYPfE
         R6PyDEMbV0fqJYLmIXzRt4HBWSDOIp6+311zEYOxL2u8OEC7+60bkC3pBAib3EXph7Db
         TEgkBKRmiOWR8nxpGR7MNewvquOMd6dRRkxm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1JFY8qJmZXd/aUl9gDLLurD+wehBfsqo8Bz40G/nWw=;
        b=Awl6FGl1Oo9rAgEYL1o1ttcYUhqEjh/6Q4PdrxZIHa7LLdwwCg1j0ufZUWYwdvKEgl
         GvfbNcDL/JSgXprCA76wr4KKuf/9WY17eZY+uernYhvYGkYXKMw0c2gKDXcKzEtccsya
         E3GoR3YjXQ/H3f7/CFe724ggsy3hyOjvVR8bzINT3NGrumcnWjN7zxTd86MxeP6LeM+Q
         ySKiSsECQElKJLA26G2Zsp6DNGgSn5udRQHO/xFV94y15fqZN7y3fTgC91vwFv+Fxl9k
         oOrqFhfnCGghnqbD4XAedQPDJUcBBsI7DxF1L7aQVPFHuxV9L/B36+F6510aDslHqNay
         EG4g==
X-Gm-Message-State: AGi0PuY5u0gbCR/MrrkURRq0HC/xyhqouJ7yOQJMxaFOdZQbw6vfBhEe
        31zGlC1huJwyufThnEyvuJAmsC/p3VhHbBpX29ppYg==
X-Google-Smtp-Source: APiQypJBp2r6Es5PVpPUyc2m1NAUrTMh1P00GZIlWuu0gAXEIz+sgXN+lihgtlNrzkjKnptXRPhsXJbgN7ojbaB5dNU=
X-Received: by 2002:a37:7443:: with SMTP id p64mr6032310qkc.269.1588999812631;
 Fri, 08 May 2020 21:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200508224026.483746-1-colin.king@canonical.com>
In-Reply-To: <20200508224026.483746-1-colin.king@canonical.com>
From:   Michael Chan <michael.chan@broadcom.com>
Date:   Fri, 8 May 2020 21:50:01 -0700
Message-ID: <CACKFLinBL4QCT6YcTn=exkHAitXHd_D_XR0zHwT1zuMfKTyWug@mail.gmail.com>
Subject: Re: [PATCH] cnic: remove redundant assignment to variable ret
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 8, 2020 at 3:40 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being assigned with a value that is never read,
> the assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>
