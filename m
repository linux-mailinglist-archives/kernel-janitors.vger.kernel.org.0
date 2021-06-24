Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001E43B343A
	for <lists+kernel-janitors@lfdr.de>; Thu, 24 Jun 2021 18:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhFXQ7G (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 24 Jun 2021 12:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhFXQ7F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Jun 2021 12:59:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48201C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Jun 2021 09:56:45 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x20so1901910ljc.5
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Jun 2021 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=g0k0h+YCj3cp/zX8mnyCXZV2dt07GS3sXPx2dws/fxIUzHddyUrEMU+HNrNvNR19zc
         3CY/PDFRjRgbx8m4O0ekdMib7tw+ytIWLiIeeNtZL1nqGayxK9yR2fv6P6l6zUasvy2L
         aur2UL509OQI3fSJ6vMrC57X6abLO75+gtBmuhA4yQkuQ+UFKBio8M0iIqLzCbXqhjPT
         ZGcbNpzm2faw2xFneeE79uxu+wDyP5yfhge1QTZWiPvRmFc8nxjAKHrXdHlRrP+3nKG/
         mqI4GVdgHLm4zkn/tI4vGt9Mikw3syVzdAZbXyrlGrY7yAK9yPDB1eu95rOnhCWuJLII
         QXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=TsDRkh6PXMZwxZZCkY91mYpZgTMrKu1gSNlVwEmFDe+4YzwaqQrxtAPdVqkceag1sd
         oV2ICjHA489fwwgyjX2a9WmEKafkxdsBIXQPfzMGLeLlB6MDzKpRAf0/it4EuZ8NI+JR
         6n3SMNHZx7CU7+gJGzVpxqTNa7k80B7ncptF1FTqLScJcjUNSsJIvBwr4A2YVil9v6a7
         ZHhrP87PpZP3gJODgHQxLNMprl7xnzYKWKnPMsv0ScqEs39uc79MuMcLAeFAASRT5WZR
         FEnI/WLgMx4FqJuWThfdjhrNqerFs+Un+KU2fUGBoCAmCJd4XKkVfwdCkJW6akGftWZT
         4LJQ==
X-Gm-Message-State: AOAM531ZDI2S8HCY/YmjfZZQ1zZI2YoO9l3Pd25xbBXH4mgHk82bKz1L
        ej9LCaKEemdmWFfWqAzcTyFzvUPZc5Ms3j4tDg==
X-Google-Smtp-Source: ABdhPJxtAeiLBlruPCcwrLWmkgSknroXKBCjRThGop7cTgXiJ23TI7C+8hcBG/dKKXLuIsXyJEOJde04Br+NtuZhkd8=
X-Received: by 2002:a2e:878a:: with SMTP id n10mr1978757lji.433.1624553803692;
 Thu, 24 Jun 2021 09:56:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:45c7:b029:fc:1b2e:6ed with HTTP; Thu, 24 Jun 2021
 09:56:42 -0700 (PDT)
Reply-To: tutywoolgar021@gmail.com
In-Reply-To: <CAOtQu3ATbDy715U2aOMdjpkYb7gH6PN06ros=ZEGQR40PD2WKg@mail.gmail.com>
References: <CAOtQu3ATbDy715U2aOMdjpkYb7gH6PN06ros=ZEGQR40PD2WKg@mail.gmail.com>
From:   tuty woolgar <baringsolim@gmail.com>
Date:   Thu, 24 Jun 2021 16:56:42 +0000
Message-ID: <CAOtQu3DzzU-_+h8UXFDPYqSFKNg5sLG2DgH+XT2i4SzySUGFkw@mail.gmail.com>
Subject: greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

My greetings to you my friend i hope you are fine and good please respond
back to me thanks,
