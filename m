Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6342B113
	for <lists+kernel-janitors@lfdr.de>; Mon, 27 May 2019 11:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfE0JK3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 27 May 2019 05:10:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40493 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE0JK3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 May 2019 05:10:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id q62so14029926ljq.7
        for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2019 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEGlKR9cMXvIeUwusBglsYeiQ+SPB2PmHYL6y3sHsr0=;
        b=FhjjRkkXUEVnfVIt6bTqWSZJb/80sf15Ilad86TcxGXBhK8aK4E1Q8KTgK9nZ7a3Wc
         L+08R9RZF08RtWFv83jca1VyQfwi7ljQUoGUnI+MLWoxcugHRvse2TEQADWqDxxGDhkv
         03VruCzQb3H2EC7bW3VH9sYFSU1DSddBsVfvpbfT+VLY9BvT7GtBotmkm3OzN5YNmVAG
         kO6OSAhPlVJGlX/tgBr5UHCMZEYKdewpzcS9XDXgV/Z2rjnIc5B86w2RLERHCubNoixu
         uI8Dtj9y6WlZ2f+MIDty1Q5bXXvSPYBMYwABhThGOV8v6RJF3aNCo0+PFKpKf3EFP0+Z
         kd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEGlKR9cMXvIeUwusBglsYeiQ+SPB2PmHYL6y3sHsr0=;
        b=Pa9zdiYhavd/vy7RE1Y0/XifTOwa0lkJL9zIvVzf3w6tDHKy64pIAvJ4VpCXJCJmx5
         3zlXnZEzpX3u4at0rmThemd0xsQhbDJ+xd5GTf+30Tm0/NqcMpUP6srxwSou02JAZz6u
         j6sx/5HugFUMeAXsUCNsey4umICtoHvctK8bzrIWw+EF+JPr+oVDbE2c0QhszMO+h68L
         62Od5kNXzlpxwmFHxAD1Dh94VOy+WhuObRE80iEPkaMLPtULEHje8HnhcjDGpnyORksr
         myGelnqiNPAmjpVrhfz3FpO4i0+O8Hna72JYotbpFccmID0ZcflwZrYX7N7TBsx/JG+k
         HN7w==
X-Gm-Message-State: APjAAAWLFLRsLW50WqFBiTOVZ0S9FPthI0K8zwb3cfztAtEzA30Jzx8x
        1ixrljFXxPpNr9oAQYk0Vg3pLrvQLj3xK6p46qnghw==
X-Google-Smtp-Source: APXvYqx3PadhULZkWPFoOWBCluXUOl+KRGzn+HWRbMqV3BUzCYyZIRy5UR/oJ53rjISdwLm4eqiipmAdUSlkYMpbwu0=
X-Received: by 2002:a2e:5c1:: with SMTP id 184mr52626256ljf.94.1558948227212;
 Mon, 27 May 2019 02:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190525204228.8546-1-colin.king@canonical.com>
In-Reply-To: <20190525204228.8546-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 May 2019 11:10:15 +0200
Message-ID: <CACRpkdadikx9MPrVUQxXa6KYsmnuoakjYVTNEcv_HOoW0pCgZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: fix spelling mistakes in pinctl documentation
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 25, 2019 at 10:42 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The spelling of configured is incorrect in the documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Bjorn's review tag.

Yours,
Linus Walleij
