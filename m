Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D292749F4A
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfFRLfd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 07:35:33 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33454 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729684AbfFRLfc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 07:35:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so9026213lfe.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+aeRI9gH7Nt+4ScPIMUDC2N/RTKJKeWLRoi5znlh1Y=;
        b=TLRAx63y+9/iuvZc7HZ5Bbxji+bKznetpTz81C5NX/1KiBJ9aAh7hg3dPhXc/VEc8E
         aY7esmunh2x4uJR6Lj5rGAyMm9l3xya0NqT1ZiV5OcFahUE+R/6zQMTNK6dYoAyoK4B0
         +Zjq20Tr4tm7P2OxMs6QlGzfzfQoh83i4OLLYlPayMwniFGmsGC1jeTImO55PUgT8JGm
         v7WQv1qXDvd0wGvXegHvttshDuofrS56yZXvhxD7NEb6XSdyPZ/Wq8iYAyJQmGKJjXfX
         91mDzM1+qtDaWYJQPxpyEq11oRDmQbmrQUbQSL80JXqKZkGuyDavULzxsXKi09ToV/hW
         0raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+aeRI9gH7Nt+4ScPIMUDC2N/RTKJKeWLRoi5znlh1Y=;
        b=GaazVcOV0/ODA4s0wq/0bijG7kdYEq4VX8VgzaVyQ65z9xuGXpYSHfpp1okTPrf1zy
         TirizO0/+lMoUFakvJwILKVMXWvw+16U060HK61zoTqtoiET8hOo0aIYZRnKqwcWA+cK
         2FCht/fUCVV9RQwBIizZCEnmEemeuNSXzynj9sIi9xC6QO5fKpVn22PzzgkgcVnrGl+A
         bE8Yi93POIycNWOSctsNZ6+W67CkJ3DjfvPx6tOliXXTRrBjNVxZNb8jkq9MpL1ABVTP
         mX6l6kSSVSzosksTqEuAJYRbYoVtQ8N/cfWj/OotpIHxSTNKjLFpeLO9VqK9s9TpO+cf
         eyNQ==
X-Gm-Message-State: APjAAAUSnm2EixiPFzDwSMHh0nm3PnsVXtkBi13Z+Lqaehy+Vuiubeht
        myiaiQI30Jq0DTZNDP3wOmdip6LtfPxOqGM3fhv66ItH
X-Google-Smtp-Source: APXvYqxhKrM4omMyzQLzxXnmN0FXTw+DZYa8K6R5TXQB0N5fWRdMtzmU3XWM6NyuGULgrb3PP2rTzlkWZyITrDQ43Ew=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr2527640lfh.92.1560857730949;
 Tue, 18 Jun 2019 04:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190613070201.GH16334@mwanda>
In-Reply-To: <20190613070201.GH16334@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 13:35:19 +0200
Message-ID: <CACRpkdaX66=g7dG7SFkgr5Dwmop-p4qe7ELkn0KERtqVvp0vNA@mail.gmail.com>
Subject: Re: [PATCH] soc: ixp4xx: npe: Fix an IS_ERR() vs NULL check in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Krzysztof Halasa <khalasa@piap.pl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 9:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_ioremap_resource() function doesn't return NULL, it returns
> error pointers.
>
> Fixes: 0b458d7b10f8 ("soc: ixp4xx: npe: Pass addresses as resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you please collect my review and send this to the ARM SoC maintainers
arm@kernel.org since they are collecting a few other IXP4xx fixes?

Yours,
Linus Walleij
